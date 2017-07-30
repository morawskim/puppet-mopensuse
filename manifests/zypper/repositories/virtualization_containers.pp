class mopensuse::zypper::repositories::virtualization_containers(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/Virtualization:/containers/${dist_key}/repodata/repomd.xml.key"

  zypprepo {'virtualization_containers':
    baseurl      => "http://download.opensuse.org/repositories/Virtualization:/containers/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Virtualization:containers (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'72174FC2':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['virtualization_containers']
  }
}
