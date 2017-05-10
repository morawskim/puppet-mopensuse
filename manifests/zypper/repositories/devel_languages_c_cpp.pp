class mopensuse::zypper::repositories::devel_languages_c_cpp(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
    include mopensuse::zypper::refresh
    $gpg_key = "http://download.opensuse.org/repositories/devel:/libraries:/c_c++/${dist_key}/repodata/repomd.xml.key"

    zypprepo {'devel_libraries_c_cpp':
        baseurl      => "http://download.opensuse.org/repositories/devel:/libraries:/c_c++/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "A project for basic libraries shared among multiple projects (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh']
    }

    rpmkey {'09CA02B0':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['devel_libraries_c_cpp']
    }
}
