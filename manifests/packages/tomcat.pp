class mopensuse::packages::tomcat {

  class { '::tomcat':
      catalina_home       => '/usr/share/tomcat',
      user                => 'tomcat',
      group               => 'tomcat',
      install_from_source => false,
      purge_connectors    => false,
      purge_realms        => false,
      manage_user         => false,
      manage_group        => false,
  }

  tomcat::config::server::tomcat_users {
      'admin':
      ensure        => present,
      catalina_base => '/opt/apache-tomcat/mycat',
      element       => 'user',
      element_name  => 'admin',
      file          => '/etc/tomcat/tomcat-users.xml',
      manage_file   => true,
      password      => 'adminadmin',
      roles         => [ 'admin', 'manager', 'admin-gui', 'admin-script',
          'manager-gui', 'manager-script', 'manager-jmx', 'manager-status'
      ],
      require       => Package['tomcat']
  }

  package {['tomcat', 'tomcat-webapps', 'tomcat-admin-webapps', 'tomcat-docs-webapp']:
    ensure => present
  }

  service {'tomcat':
    ensure     => stopped,
    enable     => false,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['tomcat']
  }

  file { '/usr/share/tomcat/work/Catalina':
      ensure  => directory,
      mode    => '0755',
      owner   => 'tomcat',
      group   => 'tomcat',
      require => Package['tomcat']
  }

  file { '/usr/share/tomcat/work/Catalina/localhost':
      ensure  => directory,
      mode    => '0775',
      owner   => 'tomcat',
      group   => 'tomcat',
      require => File['/usr/share/tomcat/work/Catalina']
  }

}