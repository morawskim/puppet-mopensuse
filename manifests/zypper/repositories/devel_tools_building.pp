class mopensuse::zypper::repositories::devel_tools_building(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
    include mopensuse::zypper::refresh
    include mopensuse::zypper::repositories::devel_tools

    $gpg_key = "http://download.opensuse.org/repositories/devel:/tools:/building/${dist_key}/repodata/repomd.xml.key"

    zypprepo {'devel_tools_building':
        baseurl      => "http://download.opensuse.org/repositories/devel:/tools:/building/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Tools for building software (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh'],
        require      => Class['mopensuse::zypper::repositories::devel_tools']
    }

}
