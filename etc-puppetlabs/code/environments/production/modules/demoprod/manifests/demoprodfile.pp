class demoprod::demoprodfile {
  file { '/root/demoprod.txt':
    ensure => present
  }
}
