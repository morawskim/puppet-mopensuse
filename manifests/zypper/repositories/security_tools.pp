class mopensuse::zypper::repositories::security_tools {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/security:tools/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'security_tools':
    baseurl      => "http://download.opensuse.org/repositories/security:tools/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Security tools for auditing and scanning (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'EE3D166A':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['security_tools']
  }
}
