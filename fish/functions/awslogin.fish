function awslogin --description "AWS Login SSO script"
    if not set -q AWS_PROFILE
        echo "AWS_PROFILE needs to be set"
        exit 1
    end

    if not set -q AWS_EMAIL
        echo "AWS_EMAIL needs to be set"
        exit 1
    end

    echo "Clearing AWS cache directory"
    rm -rf ~/.aws/cache

    echo "Clear the existing cache"
    find ~/.aws/cli/cache/ -delete -type f 2>/dev/null

    echo "Remove existing credentials"
    rm -rf ~/.aws/credentials

    set --erase AWS_ACCESS_KEY_ID
    set --erase AWS_SECRET_ACCESS_KEY
    set --erase AWS_SESSION_TOKEN

    echo "Ensuring user is logged in with SSO"
    if ! aws sts get-caller-identity 2>/dev/null 1>&2
    aws --profile sso sso login
    aws sts get-caller-identity
    end

    set -l out (cat $HOME/.aws/cli/cache/* | jq -r --arg email "$AWS_EMAIL" '. | select (.AssumedRoleUser.Arn != null) | select(.AssumedRoleUser.Arn|test($email))')

    echo "Ensuring env credentials are set"
    set -Ux AWS_ACCESS_KEY_ID (echo $out | jq -r .Credentials.AccessKeyId)
    set -Ux AWS_SECRET_ACCESS_KEY (echo $out | jq -r .Credentials.SecretAccessKey)
    set -Ux AWS_SESSION_TOKEN (echo $out | jq -r .Credentials.SessionToken)

    echo "[default]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
aws_session_token=$AWS_SESSION_TOKEN

[$AWS_PROFILE]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
aws_session_token=$AWS_SESSION_TOKEN" > ~/.aws/credentials

    echo "Done"
end
