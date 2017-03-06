class mopensuse::packages::enhancd {

  include mopensuse::zypper::repositories::morawskim

  package {['enhancd']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}