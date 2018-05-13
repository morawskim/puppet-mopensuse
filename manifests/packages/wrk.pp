class mopensuse::packages::wrk (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::benchmark

  package { 'wrk':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}
