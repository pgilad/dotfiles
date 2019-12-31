set -l google_cloud_path /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
if status --is-interactive; and test -e $google_cloud_path
    source $google_cloud_path
end
