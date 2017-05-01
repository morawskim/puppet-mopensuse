class mopensuse::zypper::repositories::kde_kup(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/home:/simper:/kup/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'kde_kup':
    baseurl      => "http://download.opensuse.org/repositories/home:/simper:/kup/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Kup Backup System (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'82CEBF3D':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['kde_kup']
  }
}
