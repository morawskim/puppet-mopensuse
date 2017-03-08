class mopensuse::zypper::repositories::devel_languages_python3(
    $enabled = 1
) {

    include mopensuse::zypper::refresh
    $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/python3/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

    zypprepo {'devel_languages_python3':
        baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/python3/openSUSE_${::operatingsystemrelease}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Python-3 modules (openSUSE_${::operatingsystemrelease})",
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
