class mopensuse::packages::smtpcli {

  include mopensuse::zypper::repositories::morawskim

  package {'smtp-cli':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

}