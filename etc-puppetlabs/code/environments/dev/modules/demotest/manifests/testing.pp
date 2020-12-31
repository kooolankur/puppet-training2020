# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include demotest::testing
class demotest::testing {
  file {'/var/tmp/unittesting':
    ensure => present
  }

  package {'git':
    ensure => installed
  }
}
