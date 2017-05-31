class mopensuse::packages::gui::multimedia($ensure = 'present') {

  include mopensuse::zypper::repositories::packman
  include mopensuse::zypper::repositories::libdvdcss

  package {['k3b-codecs', 'ffmpeg', 'lame', 'phonon-backend-vlc']:
    ensure  => $ensure,
    install_options => [ {'--from' => 'packman'} ],
    require => [ 
      Class['mopensuse::zypper::repositories::libdvdcss'],
      Class['mopensuse::zypper::repositories::packman']
    ]
  }

  package {['phonon4qt5-backend-vlc', 'vlc-codecs', 'flash-player', 'libdvdcss2']:
    ensure  => $ensure,
    install_options => [ {'--from' => 'packman'} ],
    require => [ 
      Class['mopensuse::zypper::repositories::libdvdcss'],
      Class['mopensuse::zypper::repositories::packman']
    ]
  }

  package{'k3b':
    ensure          => present,
    before          => Package['k3b-codecs'],
    install_options => [ {'--from' => 'packman'}, '--force' ]
  }

  package{'vlc-noX':
    ensure          => present,
    before          => Package['vlc-codecs'],
    install_options => [ {'--from' => 'packman'}, '--force' ]
  }

  package {'libmusicbrainz4':
    ensure => $ensure,
    before => Package['k3b-codecs']
  }

  package {'libdvbpsi9':
    ensure => $ensure,
    before => Package['vlc-codecs']
  }
}






 


