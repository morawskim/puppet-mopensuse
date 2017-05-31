class mopensuse::packages::live_fat_stick($ensure = 'present') {

  include mopensuse::zypper::repositories::education

  package {'live-fat-stick':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::education']
  }
}

