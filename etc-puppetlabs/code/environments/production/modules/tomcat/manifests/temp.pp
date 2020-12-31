class tomcat::temp {
  file {'/root/template.txt':
    content => template('tomcat/template.txt.erb')
  }
}
