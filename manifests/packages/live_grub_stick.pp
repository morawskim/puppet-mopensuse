class mopensuse::packages::live_grub_stick {

  include mopensuse::zypper::repositories::education

  package {'live-grub-stick':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::education']
  }
}

