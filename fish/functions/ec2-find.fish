function ec2-find \
    --description 'Search EC2 instances by Name tag (partial match) or exact Private IP and print <name> <ip> <instance-id>. Supports aggregation.' \
    --wrap 'aws ec2 describe-instances'

    # Parse options
    argparse 'h/help' 'a/agg' -- $argv
    if test "$status" -ne 0
        return 1
    end

    if set -q _flag_help
        echo "Usage: ec2-find [--agg] <search-term>"
        echo "Searches by private IP (exact) or by Name tag (contains)"
        echo "--agg : aggregate count by instance name"
        return 0
    end

    if test (count $argv) -eq 0
        echo (set_color yellow)"Usage:"(set_color normal)" ec2-find [--agg] <search-term>"
        return 1
    end

    set search $argv[1]

    # Function to format & sort
    function __ec2_format_and_sort
        awk '{ print $3, $2, $1 }'
    end

    # Function to aggregate counts and pretty-print table
    function __ec2_aggregate
        awk '{
            count[$3]++
            if (length($3) > maxlen) maxlen = length($3)
        } END {
            name_width = maxlen + 2
            line = "+"
            for (i = 0; i < name_width + 2; i++) line = line "-"
            line = line "+-------+"

            print line
            printf "| %-*s | %-5s |\n", name_width, "Instance Name", "Count"
            print line
            for (name in count) {
                printf "| %-*s | %-5d |\n", name_width, name, count[name]
            }
            print line
        }'
    end

    # IP detection
    if string match -rq '^\d{1,3}(\.\d{1,3}){3}$' $search
        echo (set_color green)"🔍 Searching by Private IP:"(set_color normal) $search
        set output (aws ec2 describe-instances \
            --filters "Name=private-ip-address,Values=$search" \
            --query 'Reservations[].Instances[].{Name: Tags[?Key==`Name`]|[0].Value, IP: PrivateIpAddress, ID: InstanceId}' \
            --output text | string collect)
    else
        echo (set_color green)"🔍 Searching by Name contains:"(set_color normal) $search
        set output (aws ec2 describe-instances \
            --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=*$search*" \
            --query 'Reservations[].Instances[].{Name: Tags[?Key==`Name`]|[0].Value, IP: PrivateIpAddress, ID: InstanceId}' \
            --output text | string collect)
    end

    if set -q _flag_agg
        echo "$output" | __ec2_aggregate
    else
        echo "$output" | __ec2_format_and_sort
    end
end
