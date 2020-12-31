# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include javadep
class javadep (
  $java_packages,
  $java_service,
  $java_deploy_location,
  $java_war_file,) {

  $java_packages.each |$package| {
    notify {"$package": }
  }

  include javadep::configure_java

}
