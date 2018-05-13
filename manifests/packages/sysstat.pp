class mopensuse::packages::sysstat (
  $ensure = 'present'
) {

  package { 'sysstat':
    ensure => $ensure,
  }
}
