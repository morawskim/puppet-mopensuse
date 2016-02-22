class mopensuse::zypper::repositories::hardware {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/hardware/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'hardware':
    baseurl      => "http://download.opensuse.org/repositories/hardware/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Hardware tools (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'D6D11CE4':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['hardware']
  }
  
}
