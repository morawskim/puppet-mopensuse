class mopensuse::packages::ungifsicle (
  $ensure = 'present'
) {

  package { 'ungifsicle':
    ensure => $ensure,
  }
}
