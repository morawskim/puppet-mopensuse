class mopensuse::zypper::repositories::x11_utilities(
    $enabled = 1
) {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/X11:/Utilities/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'X11_Utilities':
    baseurl      => "http://download.opensuse.org/repositories/X11:/Utilities/openSUSE_${::operatingsystemrelease}/",
    enabled      => $enabled,
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
    before  => Zypprepo['X11_Utilities']
  }
  
}
