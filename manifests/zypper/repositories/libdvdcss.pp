class mopensuse::zypper::repositories::libdvdcss {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://opensuse-guide.org/repo/${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'libdvdcss':
    baseurl      => "http://opensuse-guide.org/repo/${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "libdvdcss Repository (openSUSE_${::operatingsystemrelease})",
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
