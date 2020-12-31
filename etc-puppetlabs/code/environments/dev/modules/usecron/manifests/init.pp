# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include usecron
class usecron {
  include cron
  cron::job {'print':
    command => 'logger hostname'
  }
}
