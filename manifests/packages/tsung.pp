class mopensuse::packages::tsung {

  include mopensuse::zypper::repositories::benchmark

  package {'tsung':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}