class mopensuse::packages::proxychains_ng {

  include mopensuse::zypper::repositories::network

  package {'proxychains-ng':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::network']
  }
}