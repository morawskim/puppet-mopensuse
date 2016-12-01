class mopensuse::packages::phing {

  include mopensuse::zypper::repositories::morawskim

  package {'phing':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}