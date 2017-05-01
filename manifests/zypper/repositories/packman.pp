class mopensuse::zypper::repositories::packman(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://packman.inode.at/suse/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'packman':
    baseurl      => "http://packman.inode.at/suse/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Packman Software Repository (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'1ABD1AFB':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['packman']
  }
  
}
