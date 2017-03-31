class mopensuse::packages::wrk {

  include mopensuse::zypper::repositories::benchmark

  package {'wrk':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}