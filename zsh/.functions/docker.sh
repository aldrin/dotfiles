# Remove all untagged images.
function docker-rm-untagged-images(){
    docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
}
# Open a shell into a running container. 
function docker-bash(){
    docker exec -it $1 /bin/bash
}
# Tail a file in a container
function docker-tail(){
    docker exec -it $1 tail -f $2
}
# Run a scratch image
function docker-run(){
	  docker run -P -it --rm=true -h $1 --name $1 $1
}
# Stop all running containers
function docker-stop-all(){
    docker ps -q | xargs docker stop
}
# Remove all containers
function docker-rm-all-containers(){
    docker ps -a -q | xargs docker rm -v
}
# Wipe the slate clean
function docker-clean(){
    docker ps -a && docker-stop-all && docker-rm-all-containers
}
# Show ports
function docker-ports(){
    docker ps --format "table {{.Names}}\t{{.Ports}}"
}
# Start development containers
function docker-up(){
    docker-compose -f ~/.dotfiles/docker/docker-compose.yml up -d
}
# Stop development containers
function docker-down(){
    docker-compose -f ~/.dotfiles/docker/docker-compose.yml down -v
}
