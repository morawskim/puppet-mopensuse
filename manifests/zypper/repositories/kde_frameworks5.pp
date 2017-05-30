class mopensuse::zypper::repositories::kde_frameworks5(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }

    include mopensuse::zypper::refresh

    $gpg_key = "http://download.opensuse.org/repositories/KDE:/Frameworks5/${dist_key}/repodata/repomd.xml.key"

    zypprepo {'KDE_Frameworks5':
        baseurl      => "http://download.opensuse.org/repositories/KDE:/Frameworks5/${dist_key}/",
        enabled      => $enabled,
        autorefresh  => 1,
        descr        => "KDE Frameworks 5 development repository (${dist_key})",
        gpgcheck     => 1,
        gpgkey       => $gpg_key,
        type         => 'rpm-md',
        notify       => Class['mopensuse::zypper::refresh']
    }

    # The same key is use in kde_extra repository
    if ! defined(Rpmkey['6F88BB2F']) {
        rpmkey {'6F88BB2F':
            ensure  => present,
            source  => $gpg_key,
            before  => Zypprepo['KDE_Frameworks5']
        }
    }
}
