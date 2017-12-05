name 'topic1_cb'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures topic1_cb'
long_description 'Installs/Configures topic1_cb'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this depends are
# tracked.  A `View Issues` link will be displayed on this depends's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/topic1_cb/issues'

# The `source_url` points to the development repository for this depends.  A
# `View Source` link will be displayed on this depends's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/topic1_cb'
depends 'apache2', '~> 5.0.1'
depends 'copy_file', '~> 0.0.2'
depends 'nginx', '~> 7.0.2'
depends 'sudo', '~> 4.0.0'
#depends 'ssh_user_keys', '~> 0.1.0'
depends 'ssh_authorized_keys', '~> 0.4.0'
depends 'ssh', '~> 0.10.22'
