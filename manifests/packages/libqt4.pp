class mopensuse::packages::libqt4 (
  $ensure = 'present'
) {

  # This package provide qdbus
  package { 'libqt4':
    ensure => $ensure,
  }
}
