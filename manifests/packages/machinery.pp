class mopensuse::packages::machinery {
  
  include mopensuse::zypper::repositories::systemsmanagement_machinery

  package {'machinery':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::systemsmanagement_machinery']
  }

}