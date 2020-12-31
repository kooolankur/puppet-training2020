# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mod3::create
class mod3::create (
  $d_name=$mod3::params::dirname,
  $f_name=$mod3::params::filename) inherits mod3::params
{

  file {"$d_name":
    ensure => directory
  }

  file {"$f_name":
    ensure => file
  }
}
