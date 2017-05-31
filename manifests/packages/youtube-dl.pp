class mopensuse::packages::youtube-dl($ensure = 'present') {
  
  include mopensuse::zypper::repositories::packman

  package {'youtube-dl':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::packman']
  }

}