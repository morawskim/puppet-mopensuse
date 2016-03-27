class mopensuse::packages::gui::multimedia {
  
  include mopensuse::zypper::repositories::packman
  include mopensuse::zypper::repositories::libdvdcss
  
  package {['k3b-codecs', 'ffmpeg', 'lame', 'phonon-backend-vlc', 'phonon4qt5-backend-vlc',
    'vlc-codecs', 'flash-player', 'libdvdcss2']:
    ensure  => present,
    require => [ 
      Class['mopensuse::zypper::repositories::libdvdcss'],
      Class['mopensuse::zypper::repositories::packman']
    ]
  }
  
  package {['phonon-backend-gstreamer', 'phonon4qt5-backend-gstreamer']:
    ensure => absent
  }
  
}







 


