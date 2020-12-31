define myresource($msg=$title,$user,$file) {
    notify { "My msg is ${msg}": }
    file { "/root/${file}.txt":
      ensure => file,
      owner => $user,
      require => User[$user]
    }
    user { "$user":
      ensure => present
    }
    exec { 'say hello':
      cwd => '/root',
      path => '/bin',
      command => "/bin/echo ${msg} >> /root/${file}.txt",
      unless => "grep -q 'Time to play' /root/${file}.txt"
    }    
  }

node default {
  include firstmod

  notify { 'hello DEV': }

  file { '/root/demodir':
    ensure => directory
  }

  file { '/root/demodir/demofile.txt':
    ensure => present,
    content => 'i am on dev machine'
  }

  group { 'playdevgroup':
    gid => 1001
  }

  user { 'playdevuser':
    groups => 'playdevgroup',
    password => '$6$SYShYc7EScgmoW/G$bEM4pwOoFAQSm7xV7OCg6Y3R3RNfW7LtBgzk6jAsIBeS2owws0E4T/w2cX6UwimTAZs44uIdn182i6mkNOjnQ/'
  }

  package { 'git':
    ensure => installed
  }

  cron { 'helloall':
    command => 'echo "helloall"',
  }

  host { 'google.com':
    ip => '8.8.8.8'
  }


  file { '/root/link':
    ensure => link,
    target => '/etc/puppetlabs/puppet'
  }

  package { 'rubygems':
    ensure => installed
  }

  package { 'sinatra':
   ensure => installed,
   provider => 'gem'
  }

  $hostname = 'globalhostname'

  notify { "$ipaddress - $hostname": }

  notify { "$ipaddress - global - ${::hostname}": }

  notify { "$ipaddress - facts - ${facts['hostname']}": }
 
  unless "${facts['timezone']}" == "PST" {
    notify { "Good Morning Friends": }
  }

  case "${facts[hostname]}" {
  'node1': {user { 'node1':
           ensure => present
         }}
  'node2': {user { 'node2':
           ensure => present
         }}
  default: { notify { 'different hostname': } }
  }

  $packages = ['net-tools','wget','curl']

  $packages.each |$package| {
    package {"$package":
      ensure => installed
    }
  }

  include mod3
  include hmod
#  include javadep
  include roles::tomcatappserver
  include usecron

  myresource { 'Time to play with myresource':
    file => 'test_resource',
    user => 'testresourcesuser'
  }
 
}
