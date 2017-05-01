class mopensuse::zypper::repositories::libdvdcss(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://opensuse-guide.org/repo/${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'libdvdcss':
    baseurl      => "http://opensuse-guide.org/repo/${::operatingsystemrelease}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "libdvdcss Repository (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'6867F5BE':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['libdvdcss']
  }
  
}
