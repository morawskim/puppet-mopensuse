class mopensuse::packages::wireshark (
  $ensure = 'present'
) {

  package { 'wireshark':
    ensure => $ensure,
  }
}
