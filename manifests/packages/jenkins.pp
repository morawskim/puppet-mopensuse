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
  
}