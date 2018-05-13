class mopensuse::packages::iperf (
  $ensure = 'present'
) {

  package { 'iperf':
    ensure => $ensure,
  }
}
