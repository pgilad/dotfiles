set -gx PATH "/opt/chef-workstation/bin" "/Users/giladpeleg/.chefdk/gem/ruby/2.6.0/bin" "/opt/chef-workstation/embedded/bin" "/Users/giladpeleg/.local/share/nvm/versions/node/v13.13.0/bin" "/Users/giladpeleg/.pyenv/versions/3.8.2/bin" "/usr/local/Cellar/pyenv/1.2.18/libexec" "/usr/local/Cellar/pyenv-virtualenv/1.1.5/shims" "/Users/giladpeleg/.pyenv/shims" "/Users/giladpeleg/go/bin" "/usr/local/opt/tcl-tk/bin" "/Users/giladpeleg/.sdkman/candidates/maven/current/bin" "/Users/giladpeleg/.sdkman/candidates/java/current/bin" "/Users/giladpeleg/.sdkman/candidates/groovy/current/bin" "/Users/giladpeleg/.sdkman/candidates/gradle/current/bin" "/Users/giladpeleg/.local/share/gem/bin" "/usr/local/opt/openssl/bin" "/Users/giladpeleg/.local/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/opt/X11/bin" "/Library/Apple/usr/bin" "/usr/local/MacGPG2/bin" "/usr/local/Cellar/pyenv-virtualenv/1.1.5/shims" "/Users/giladpeleg/.pyenv/shims" "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin" "/opt/chef-workstation/gitbin" 2>/dev/null;
set -gx GEM_ROOT "/opt/chef-workstation/embedded/lib/ruby/gems/2.6.0";
set -gx GEM_HOME "/Users/giladpeleg/.chefdk/gem/ruby/2.6.0";
set -gx GEM_PATH "/Users/giladpeleg/.chefdk/gem/ruby/2.6.0:/opt/chef-workstation/embedded/lib/ruby/gems/2.6.0";
# Fish Shell command-line completions for Chef Workstation

function __fish_chef_no_command --description 'Test if chef has yet to be given the main command'
  set -l cmd (commandline -opc)
  test (count $cmd) -eq 1
end

complete -c chef -f -n '__fish_chef_no_command' -a exec -d "Runs the command in context of the embedded ruby"
complete -c chef -f -n '__fish_chef_no_command' -a env -d "Prints environment variables used by Chef Workstation"
complete -c chef -f -n '__fish_chef_no_command' -a gem -d "Runs the `gem` command in context of the embedded Ruby"
complete -c chef -f -n '__fish_chef_no_command' -a generate -d "Generate a new repository, cookbook, or other component"
complete -c chef -f -n '__fish_chef_no_command' -a shell-init -d "Initialize your shell to use Chef Workstation as your primary Ruby"
complete -c chef -f -n '__fish_chef_no_command' -a install -d "Install cookbooks from a Policyfile and generate a locked cookbook set"
complete -c chef -f -n '__fish_chef_no_command' -a update -d "Updates a Policyfile.lock.json with latest run_list and cookbooks"
complete -c chef -f -n '__fish_chef_no_command' -a push -d "Push a local policy lock to a policy group on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a push-archive -d "Push a policy archive to a policy group on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a show-policy -d "Show policyfile objects on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a diff -d "Generate an itemized diff of two Policyfile lock documents"
complete -c chef -f -n '__fish_chef_no_command' -a export -d "Export a policy lock as a Chef Infra Zero code repo"
complete -c chef -f -n '__fish_chef_no_command' -a clean-policy-revisions -d "Delete unused policy revisions on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a clean-policy-cookbooks -d "Delete unused policyfile cookbooks on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a delete-policy-group -d "Delete a policy group on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a delete-policy -d "Delete all revisions of a policy on the Chef Infra Server"
complete -c chef -f -n '__fish_chef_no_command' -a undelete -d "Undo a delete command"
complete -c chef -f -n '__fish_chef_no_command' -a describe-cookbook -d "Prints cookbook checksum information used for cookbook identifier"
complete -c chef -f -n '__fish_chef_no_command' -a provision -d "Provision VMs and clusters via cookbook"

