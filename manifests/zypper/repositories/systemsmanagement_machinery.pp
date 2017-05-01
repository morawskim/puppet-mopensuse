class mopensuse::zypper::repositories::systemsmanagement_machinery(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
    include mopensuse::zypper::refresh

    $gpg_key = "http://download.opensuse.org/repositories/systemsmanagement:/machinery/${dist_key}/repodata/repomd.xml.key"

    zypprepo {'systemsmanagement_machinery':
        baseurl      => "http://download.opensuse.org/repositories/systemsmanagement:/machinery/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Machinery systems management toolkit (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh'],
    }

    rpmkey {'A0E46E11':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['systemsmanagement_machinery']
    }
}