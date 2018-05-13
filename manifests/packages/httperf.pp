class mopensuse::packages::httperf (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::benchmark

  package { 'httperf':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}
