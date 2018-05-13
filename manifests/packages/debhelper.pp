class mopensuse::packages::debhelper (
  $ensure = 'present'
) {

  package { 'debhelper':
    ensure => $ensure,
  }
}
