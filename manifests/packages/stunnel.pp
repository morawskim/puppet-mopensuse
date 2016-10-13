class mopensuse::packages::stunnel {

  include mopensuse::zypper::repositories::packman

  package {'stunnel':
    ensure => present,
    require => Class['mopensuse::zypper::repositories::packman'],
    install_options => [ {'--repo' => 'packman'} ]
  }
}