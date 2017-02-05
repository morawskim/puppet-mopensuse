class mopensuse::zypper::repositories::devel_tools_building(
    $enabled = 1
) {

    include mopensuse::zypper::refresh
    include mopensuse::zypper::repositories::devel_tools

    $gpg_key = "http://download.opensuse.org/repositories/devel:/tools:/building/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

    zypprepo {'devel_tools_building':
        baseurl      => "http://download.opensuse.org/repositories/devel:/tools:/building/openSUSE_${::operatingsystemrelease}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Tools for building software (openSUSE_${::operatingsystemrelease})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh'],
        require      => Class['mopensuse::zypper::repositories::devel_tools']
    }

}
