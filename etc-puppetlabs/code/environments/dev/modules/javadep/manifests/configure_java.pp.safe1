# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include javadep::configure_java
class javadep::configure_java {

  $javadep::java_packages.each |$package| {
    notify {"This is installing - ${package}": }
    package { "$package":
      ensure => installed
    }
  }

  Service {"$javadep::java_service":
    ensure => "running",
    require => Package["$javadep::java_service"]
  }

  File {"${javadep::java_deploy_location}/${javadep::java_war_file}":
     source => "puppet:///modules/javadep/${javadep::java_war_file}",
     notify => Service["$javadep::java_service"]
  }
}
