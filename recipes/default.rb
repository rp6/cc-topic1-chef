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
#package "ssh_user_keys"
package "sudo"
#Message of the day


directory '/message' do
  action :create
end
#GROUP
group 'lecturer' do

end

#USER Kappel
user 'ckappel' do
  uid '1234'
  home '/home/ckappel'
  shell '/bin/zsh'
  group 'lecturer'
  password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
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


#MESSAGE OF THE DAY
template '/etc/motd' do
   source 'MessageOfTheDay.erb'
   variables(
      groupID: node.default["GroupID"],
      lecturer: ['Kappel'],
      members: ['Rieser','Jusic', 'Puhwein', 'Hota'],
      changeMe: node.default["MessageOfTheDay"]
   )
end

#APACHE WEBSERVER
#name "webserver"
#    description "Systems that serve HTTP and HTTPS"
#    run_list(
#      "recipe[apache2]",
#      "recipe[apache2::mod_ssl]"
#    )
#    default_attributes(
#      "apache" => {
#        "listen" => ["*:80", "*:443"]
#      }
#    )
