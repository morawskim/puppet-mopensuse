class mopensuse::packages::devel-kde {

    include mopensuse::zypper::repositories::kde_frameworks5
    include mopensuse::packages::devel-qt5

    package {['patterns-openSUSE-devel_kde', 'libqt4-devel', 'libkde4-devel']:
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::kde_frameworks5'],
  }
}
