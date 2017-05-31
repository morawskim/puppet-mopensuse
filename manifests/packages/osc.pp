class mopensuse::packages::osc($ensure = 'present') {

  package {'osc':
    ensure => $ensure,
  }
}