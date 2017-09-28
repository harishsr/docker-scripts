#!/usr/bin/env ruby

#                 _   _               _
#  _ __ ___   ___| |_| |__   ___   __| |___
# | '_ ` _ \ / _ \ __| '_ \ / _ \ / _` / __|
# | | | | | |  __/ |_| | | | (_) | (_| \__ \
# |_| |_| |_|\___|\__|_| |_|\___/ \__,_|___/
def destroy_thing(kind, command)
  puts "Are you sure you want to DELETE all stopped #{kind}s (y/N)?"
  delete_thing = gets.chomp
  return "No #{kind}s will be removed." if delete_thing != 'y'
  exec command
end

def destroy_images
  destroy_thing 'image', 'docker rmi $(docker images -aq)'
end

def destroy_containers
  existing = `docker ps -aq`.gsub(`docker ps -q`, '')
  destroy_thing 'container', "docker rm #{existing}"
end

#                           _
#   _____  _____  ___ _   _| |_ ___
#  / _ \ \/ / _ \/ __| | | | __/ _ \
# |  __/>  <  __/ (__| |_| | ||  __/
#  \___/_/\_\___|\___|\__,_|\__\___|
#

destroy_images
destroy_containers
