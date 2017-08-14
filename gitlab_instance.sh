#!/usr/bin/env ruby

# VARIABLES
ssh_port = 2222
http_port = 8888
puts "What version of GitLab do you want to use?"
version = gets.chomp
name = "gitlab-#{version.gsub(/-.e\.\d/, '')}"
docker_command = "docker run --detach --env GITLAB_OMNIBUS_CONFIG=\"external_url 'http://$(docker-machine ip gitlab-test-env):#{http_port}'; gitlab_rails['gitlab_shell_ssh_port'] = #{ssh_port};\" --hostname $(docker-machine ip gitlab-test-env) -p #{http_port}:#{http_port} -p #{ssh_port}:22 --name #{name} gitlab/gitlab-ee:#{version}"

# INSTALL IT
puts "\nInstalling GitLab #{version} and naming it #{name}"
exec docker_command

puts "Finished!"
