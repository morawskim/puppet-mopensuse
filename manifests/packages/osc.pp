class mopensuse::packages::osc($ensure = 'present') {

  package {'osc':
    ensure => $ensure,
  }

  group { 'osc':
    ensure  => 'present',
    system     => true,
  }
}
