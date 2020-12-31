# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hmod
class hmod ($hvar) {

  notify { "My hvar value from hiera is ${hmod::hvar}": }
}
