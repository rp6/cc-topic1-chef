#
# Cookbook:: topic1_cb
# Recipe:: default
#
# Copyright:: 2017, Rieser, Hota, Puhwein, Jusic , All Rights Reserved.
#include_recipe "topic1_cb"
#package "git"

package "ssh"

package "apache2"

#Message of the day


directory '/message' do
  action :create
end


template '/message/test.txt' do
   source 'MessageOfTheDay.erb'
   variables(
      groupID: 1,
      lecturer: ['Kappel'],
      members: ['Rieser','Jusic', 'Puhwein', 'Hota'],
      changeMe: 'To Change'
   )
end

user 'kappel' do
  uid '1234'
  home '/home/random'
  shell '/bin/zsh'
  password '$1$JJsvHslasdfjVEroftprNn4JHtDi'
end
