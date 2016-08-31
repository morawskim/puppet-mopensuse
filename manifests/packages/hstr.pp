class mopensuse::packages::hstr {

  include mopensuse::zypper::repositories::morawskim

  package {'hstr':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}