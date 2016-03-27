class mopensuse::zypper::repositories::packman {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://packman.inode.at/suse/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'packman':
    baseurl      => "http://packman.inode.at/suse/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Packman Software Repository (openSUSE_${::operatingsystemrelease})",
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
