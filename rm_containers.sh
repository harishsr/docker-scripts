#!/usr/bin/env ruby

#                 _   _               _
#  _ __ ___   ___| |_| |__   ___   __| |___
# | '_ ` _ \ / _ \ __| '_ \ / _ \ / _` / __|
# | | | | | |  __/ |_| | | | (_) | (_| \__ \
# |_| |_| |_|\___|\__|_| |_|\___/ \__,_|___/
def destroy_thing(kind, command)
  puts "Are you sure you want to DELETE all stopped #{kind}s (y/N)?"
  should_we_delete = gets.chomp.downcase
  if should_we_delete == 'y'
    exec command
  else
    puts "No #{kind}s will be removed."
  end
end

def destroy_images
  destroy_thing 'image', 'docker rmi $(docker images -aq)'
end

def destroy_containers
  destroy_thing 'container', 'docker rm $(docker ps -aq)'
end

#                           _
#   _____  _____  ___ _   _| |_ ___
#  / _ \ \/ / _ \/ __| | | | __/ _ \
# |  __/>  <  __/ (__| |_| | ||  __/
#  \___/_/\_\___|\___|\__,_|\__\___|
#

destroy_images
destroy_containers
