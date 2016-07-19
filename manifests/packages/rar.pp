class mopensuse::packages::rar {

  include mopensuse::zypper::repositories::packman

  package {'rar':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::packman']
  }

}