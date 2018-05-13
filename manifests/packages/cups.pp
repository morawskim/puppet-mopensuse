class mopensuse::packages::cups (
  $ensure = 'present'
) {

  package { 'cups':
    ensure => $ensure,
  }

  service { 'cups':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [ Package['cups'] ]
  }
}
