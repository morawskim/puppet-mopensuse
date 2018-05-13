class mopensuse::packages::devel_kde (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_frameworks5
  include mopensuse::packages::devel_qt5

  package { ['patterns-openSUSE-devel_kde', 'libqt4-devel', 'libkde4-devel']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_frameworks5'],
  }
}
