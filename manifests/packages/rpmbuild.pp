class mopensuse::packages::rpmbuild (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_tools

  package { ['libtool', 'man', 'netcfg', 'patterns-openSUSE-base', 'rpmlint',
    'patterns-openSUSE-devel_rpm_build', 'rpm-build', 'rpmdevtools', 'spectool']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel_tools']
  }
}
