class mopensuse::zypper::repositories::devel_languages_python3(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
    include mopensuse::zypper::refresh
    $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/python3/${dist_key}/repodata/repomd.xml.key"

    zypprepo {'devel_languages_python3':
        baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/python3/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Python-3 modules (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh']
    }

    rpmkey {'628F16E3':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['devel_languages_python3']
    }
}
