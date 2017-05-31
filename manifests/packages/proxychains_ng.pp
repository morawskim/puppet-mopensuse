class mopensuse::packages::proxychains_ng($ensure = 'present') {

  include mopensuse::zypper::repositories::network

  package {'proxychains-ng':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::network']
  }
}