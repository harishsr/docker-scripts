#!/bin/bash
#
# This function sets the docker-machine IP (dynamic) in the
# /etc/hosts file.  It redirects to `gl.docker.com`.  Add the port
# to get to the site (ex: gl.docker.com:8888)
#
# http://cavaliercoder.com/blog/update-etc-hosts-for-docker-machine.html
#

update-docker-host(){
	# clear existing gl.docker.com entry from /etc/hosts
	sudo sed -i '' '/[[:space:]]gl\.docker\.com$/d' /etc/hosts

	# get ip of running machine
	export DOCKER_IP="$(echo ${DOCKER_HOST} | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"

	# update /etc/hosts with docker machine ip
	[[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	gl.docker.com\" >> /etc/hosts"
}

update-docker-host
eval "$(docker-machine env gitlab-test-env)"
