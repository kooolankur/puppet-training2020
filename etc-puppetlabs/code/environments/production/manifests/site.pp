node default {
  file { 'default':
    path => '/tmp/default.txt',
    ensure => present
  }

  include tomcat

  include demoprod
 
  class { 'mod1::modoneuser':
    username => 'modoneuser1',
  }

  class { 'mod2':
    fname => '/var/tmp/mod2testfile',
    fpermission => '0777',
  }

}

#node 'node2.localdomain' {
#  notify { 'hello': }
#}
