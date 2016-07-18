class mopensuse::zypper::repositories::systemsmanagement_machinery {

    include mopensuse::zypper::refresh

    $gpg_key = "http://download.opensuse.org/repositories/systemsmanagement:/machinery/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

    zypprepo {'systemsmanagement_machinery':
        baseurl      => "http://download.opensuse.org/repositories/systemsmanagement:/machinery/openSUSE_${::operatingsystemrelease}/",
        enabled      => 1,
        autorefresh  => 1,
        descr        => "Machinery systems management toolkit (openSUSE_${::operatingsystemrelease})",
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