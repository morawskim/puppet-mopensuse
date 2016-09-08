class mopensuse::packages::live_fat_stick {

  include mopensuse::zypper::repositories::education

  package {'live-fat-stick':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::education']
  }
}

