class mopensuse::packages::easy_rsa2 {

  include mopensuse::zypper::repositories::morawskim

  package {'easy-rsa2':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}