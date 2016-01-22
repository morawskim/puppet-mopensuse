class mopensuse::zypper::repositories::devel_tools {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/devel:/tools/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'devel_tools':
    baseurl      => "http://download.opensuse.org/repositories/devel:/tools/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Generic Development Tools (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'498D5A23':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['devel_tools']
  }
  
}
