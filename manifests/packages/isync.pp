class mopensuse::packages::isync($ensure = 'present') {

  include mopensuse::zypper::repositories::server_mail

  package {'isync':
      ensure  => $ensure,
      require => Class['mopensuse::zypper::repositories::server_mail']
  }
}