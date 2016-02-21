class mopensuse::zypper::repositories::x11_utilities {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/X11:/Utilities/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'X11_Utilities':
    baseurl      => "http://download.opensuse.org/repositories/X11:/Utilities/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "X11 Utilities (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'0F2672C8':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['X11_Utilities']
  }
  
}
