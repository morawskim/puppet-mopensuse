class mopensuse::packages::tomcat {
  
  package {['tomcat', 'tomcat-webapps', 'tomcat-admin-webapps', 'tomcat-docs-webapp']:
    ensure => present
  }
  
  service {'tomcat':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['tomcat']
  }
}