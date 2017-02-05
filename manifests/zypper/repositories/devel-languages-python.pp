class mopensuse::zypper::repositories::devel-languages-python(
    $enabled = 1
) {
    
    include mopensuse::zypper::refresh
    
    $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
    
    zypprepo {'devel-languages-python':
        baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_${::operatingsystemrelease}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Python Modules (openSUSE_${::operatingsystemrelease})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh']
    }
    
    rpmkey {'EDF0D733':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['devel-languages-python']
    }
    
}
