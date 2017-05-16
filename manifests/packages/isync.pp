class mopensuse::packages::isync {

  include mopensuse::zypper::repositories::server_mail

  package {'isync':
      ensure  => present,
      require => Class['mopensuse::zypper::repositories::server_mail']
  }
}