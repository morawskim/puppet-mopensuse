class mopensuse::zypper::repositories::education {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/Education/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'education':
    baseurl      => "http://download.opensuse.org/repositories/Education/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Applications for education users (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'C0951497':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['education']
  }
}
