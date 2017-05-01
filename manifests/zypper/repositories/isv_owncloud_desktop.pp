class mopensuse::zypper::repositories::isv_owncloud_desktop(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'isv_owncloud_desktop':
    baseurl      => "http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "The ownCloud Desktop Client (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'557BEFF9':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['isv_owncloud_desktop']
  }
  
}
