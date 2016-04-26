class mopensuse::packages::jenkins {

  include mopensuse::zypper::repositories::jenkins

  package {'jenkins':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::jenkins']
  }

  service { 'jenkins':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['jenkins']
  }
  
  augeas { "/files/etc/sysconfig/jenkins/JENKINS_PORT":
    changes => [
    'set /files/etc/sysconfig/jenkins/JENKINS_PORT \'"8880"\'',
    ],
    require => [ Package["augeas"], Package['jenkins'] ],
    notify  => Service['jenkins']
  }
}