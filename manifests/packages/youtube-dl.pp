class mopensuse::packages::youtube-dl {
  
  include mopensuse::zypper::repositories::packman

  package {'youtube-dl':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }

}