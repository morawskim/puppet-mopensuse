class mopensuse::packages::tsung($ensure = 'present') {

  include mopensuse::zypper::repositories::benchmark

  package {'tsung':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::benchmark']
  }
}