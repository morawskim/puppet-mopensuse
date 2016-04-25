class mopensuse::zypper::repositories::filesystems {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/filesystems/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'filesystems':
      baseurl      => "http://download.opensuse.org/repositories/filesystems/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Filesystem tools and FUSE-related packages (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'324E6311':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['filesystems']
  }

}
