class mopensuse::packages::gui::multimedia {

  include mopensuse::zypper::repositories::packman
  include mopensuse::zypper::repositories::libdvdcss

  package {['k3b-codecs', 'ffmpeg', 'lame', 'phonon-backend-vlc']:
    ensure  => present,
    install_options => [ {'--from' => 'packman'} ],
    require => [ 
      Class['mopensuse::zypper::repositories::libdvdcss'],
      Class['mopensuse::zypper::repositories::packman']
    ]
  }

  package {['phonon4qt5-backend-vlc', 'vlc-codecs', 'flash-player', 'libdvdcss2']:
    ensure  => present,
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
    ensure => present,
    before => Package['k3b-codecs']
  }

  package {'libdvbpsi9':
    ensure => present,
    before => Package['vlc-codecs']
  }
}






 


