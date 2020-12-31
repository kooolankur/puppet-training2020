# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mod2::modtwofile
class mod2::modtwofile ($filename,$filepermission)
{
  file { "$filename":
    mode => "$filepermission",
    ensure => present
  }
}
