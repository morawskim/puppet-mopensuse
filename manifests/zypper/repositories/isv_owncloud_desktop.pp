class mopensuse::zypper::repositories::isv_owncloud_desktop {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'isv_owncloud_desktop':
    baseurl      => "http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "The ownCloud Desktop Client (openSUSE_${::operatingsystemrelease})",
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
