class mopensuse::zypper::repositories::utilities {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/utilities/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'utilities':
      baseurl    => "http://download.opensuse.org/repositories/utilities/openSUSE_${::operatingsystemrelease}",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "all the small tools for the shell (openSUSE_${::operatingsystemrelease}",
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
