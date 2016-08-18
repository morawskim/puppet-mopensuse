class mopensuse::packages::sslscan {

  include mopensuse::zypper::repositories::morawskim

  package {'sslscan':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

}