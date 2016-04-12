class mopensuse::packages::bup {
  
  include mopensuse::zypper::repositories::morawskim
 
  package {'bup':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}