function dc --description "Docker Compose" --wraps "docker compose"
	command docker compose $argv
end
