# Defined in /var/folders/l6/_mg_k92s79d880pkdx6b7kxccs_jx_/T//fish.4yj2fl/jenkins.fish @ line 2
function jenkins-cli --description 'Jenkins CLI'
	set token (grep @github.com ~/.git-credentials | cut -d@ -f1 | cut -d: -f3)
    set username samrocketman
    set jenkins_jar ~/.jenkins/jenkins-cli.jar
    set remote_uri "http://jenkins.company.com:8080/"

    java -jar $jenkins_jar -s $remote_uri -auth "$username:$token" $argv
end
