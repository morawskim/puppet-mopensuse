class mopensuse::zypper::repositories::utilities(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/utilities/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'utilities':
    baseurl      => "http://download.opensuse.org/repositories/utilities/${dist_key}",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "all the small tools for the shell (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'9056621D':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['utilities']
  }
}
