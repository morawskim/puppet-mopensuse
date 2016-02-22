class mopensuse::zypper::repositories::kde_kup {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/home:/simper:/kup/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'kde_kup':
    baseurl      => "http://download.opensuse.org/repositories/home:/simper:/kup/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Kup Backup System (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'82CEBF3D':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['kde_kup']
  }
}
