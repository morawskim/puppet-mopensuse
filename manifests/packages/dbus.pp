class mopensuse::packages::dbus (
  $ensure = 'present'
) {
  include mopensuse::packages::libqt4

  package { 'dbus-1':
    ensure => $ensure,
  }
}
