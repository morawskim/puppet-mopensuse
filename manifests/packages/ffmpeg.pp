class mopensuse::packages::ffmpeg($ensure = 'present') {

  include mopensuse::zypper::repositories::packman

  package { ['ffmpeg']:
    ensure  => $ensure,
    install_options => [ {'--from' => 'packman'} ],
    require => [
      Class['mopensuse::zypper::repositories::packman']
    ]
  }
}

