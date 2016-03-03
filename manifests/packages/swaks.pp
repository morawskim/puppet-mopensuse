class mopensuse::packages::swaks {
  
  include mopensuse::zypper::repositories::morawskim
 
  package {'swaks':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}