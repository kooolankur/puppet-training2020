# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mod1::modoneuser
class mod1::modoneuser ($username)
{
  user { "$username":
    ensure => present,
    uid => '1100',
  }
}
