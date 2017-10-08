class mopensuse::zypper::repositories::devel_languages_python(
    $enabled = 1
) {
    
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
    include mopensuse::zypper::refresh
    
    $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/python/${dist_key}/repodata/repomd.xml.key"
    
    zypprepo {'devel_languages_python':
        baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/python/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "Python Modules (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh']
    }
    
    rpmkey {'EDF0D733':
        ensure  => present,
        source  => $gpg_key,
        before  => Zypprepo['devel_languages_python']
    }
    
}