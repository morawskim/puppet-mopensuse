class mopensuse::packages::machinery($ensure = 'present') {
  
  include mopensuse::zypper::repositories::systemsmanagement_machinery

  package {'machinery':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::systemsmanagement_machinery']
  }

}