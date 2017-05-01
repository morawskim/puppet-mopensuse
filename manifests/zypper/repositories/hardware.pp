class mopensuse::zypper::repositories::hardware(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/hardware/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'hardware':
    baseurl      => "http://download.opensuse.org/repositories/hardware/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Hardware tools (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'D6D11CE4':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['hardware']
  }
  
}
