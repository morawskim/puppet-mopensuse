class mopensuse::zypper::repositories::network(
    $enabled = 1
) {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/network/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'network':
    baseurl      => "http://download.opensuse.org/repositories/network/openSUSE_${::operatingsystemrelease}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Networking services and related tools (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'17280DDF':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['network']
  }
}
