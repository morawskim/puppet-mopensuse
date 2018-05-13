class mopensuse::packages::systemd (
  $ensure = 'present'
) {

  package { 'systemd':
    ensure => $ensure,
  }
}
