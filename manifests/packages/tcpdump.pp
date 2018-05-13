class mopensuse::packages::tcpdump (
  $ensure = 'present'
) {

  package { 'tcpdump':
    ensure => $ensure,
  }
}
