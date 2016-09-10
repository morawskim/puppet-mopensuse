class mopensuse::packages::fakeprovide {

  include mopensuse::zypper::repositories::morawskim

  package {'fakeprovide':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}