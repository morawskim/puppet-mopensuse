class mopensuse::packages::httperf {

  include mopensuse::zypper::repositories::benchmark

  package {'httperf':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}