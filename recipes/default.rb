#
# Cookbook:: topic1_cb
# Recipe:: default
#
# Copyright:: 2017, Rieser, Hota, Puhwein, Jusic , All Rights Reserved.
#include_recipe "topic1_cb"
#package "git"


#package "openssh"
#node.default['openssh']['server']['password_authentication'] = "no"

#package "sshd"

#package "apache2"
package "apache2"
package "ssh"
package "sudo"


#CONFIGURE APACHE
node.default['apache']['listen'] = ['*:8080','*:8443']


directory '/message' do
  action :create
end

#GROUP
group 'lecturer' do
end

#USER Kappel
user 'ckappel' do
  uid '1234'
  home '/home/kappelc'
  shell '/bin/zsh'
  group 'lecturer'
  password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
end
group "wheel" do
  action :manage
  members ['ckappel']
end
directory '/home/kappelc' do
  action :create
  owner 'ckappel'
end

directory '/home/kappelc/.ssh/' do
  action :create
  owner 'ckappel'
end

file '/home/kappelc/.ssh/authorized_keys' do
  action :create
  owner 'ckappel'
  content 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8P/xCm04oGnW48GtGGHOBnrM6PBThwo0213DGf1Q8b+8Nau/g3Yk1F+yToLT85GfqHBiLEBP1WGsAVgIcoluE5JWl03PJnz8WcoVh7I5nYiuSjhFAguNc8z/0qHypWpU+VmWfQnee7yGTIBHF27TBouSwBjsJKBkYaTzF7llVAYy873v6K6Owmfx28YxhrZEx1HgyoHl6AbYZh9dmbRsMtO3WR6hThtTfiFSHa/XNEMsB/VTF8aQOXFy3BYqCe1CWQ6QNZpdZwRep2cVqiRKlzv1JXS+R8PbdGkMMq/e92J4p1e+4qea3BjQLozY8rvneVYaooYFeFGzRvi18ceCV christoph@bytesource.net'
end
#node.default['authorization']['sudo']['sudoers_defaults'] = ['ckappel']

#ssh_authorize_key 'ckappel@acme.com' do
#  key 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCctNyRouVDhzjiP'
#  user 'ckappel'
#end


#USER animmervoll
user 'animmervoll' do
  uid '123134'
  home '/home/nimm'
  shell '/bin/bash'
  group 'lecturer'
  password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
end

directory '/home/nimm' do
  action :create
  owner 'animmervoll'
end
directory '/home/nimm/.ssh' do
  action :create
  owner 'animmervoll'
end



#MESSAGE OF THE DAY
template '/etc/motd' do
   source 'MessageOfTheDay.erb'
   variables(
      groupID: node.default["GroupID"],
      lecturer_firstname: node.default["lecturer_firstname"],
      lecturer_surename: node.default["lecturer_surename"],
      members: node.default["groupmembers"],
      changeMe: node.default["MessageOfTheDay"]
   )
end


directory '/var/www/httpd/' do
  action :create
end

template '/var/www/httpd/index.html' do
  source 'MessageOfTheDay.erb'
  variables(
    groupID: node.default["GroupID"],
    lecturer: node.default["lecturer"],
    members: node.default["members"],
    changeMe: node.default["MessageOfTheDay"]
  )
end
