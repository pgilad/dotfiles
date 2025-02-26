# Set AWS config file locations:
# https://github.com/aws/aws-cli/issues/243

# set -gx AWS_CREDENTIAL_FILE "$XDG_CONFIG_HOME/aws/credentials"
# set -gx AWS_WEB_IDENTITY_TOKEN_FILE "$XDG_CONFIG_HOME/aws/token"
# The world isn't ready for dotfiles free home dir :(
# https://github.com/boto/boto/issues/3819
set -gx AWS_CLI_HISTORY_FILE "$APPLICATIONS_HISTORY_PATH/aws_history"
set -gx AWS_CONFIG_FILE "$HOME/.aws/config"
set -gx AWS_CREDENTIAL_PROFILES_FILE "$HOME/.aws/credentials" # Version 1.x
set -gx AWS_PROFILE "assume-brain"
set -gx AWS_SHARED_CREDENTIALS_FILE "$HOME/.aws/credentials" # Version 2.x
set -gx AWS_DEFAULT_REGION "us-east-1"
