class mopensuse::packages::rpmbuild (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_tools
  include mopensuse::packages::patterns_base
  include mopensuse::packages::patterns_devel_rpm_build

  package{['libtool', 'man', 'netcfg', 'rpmlint',
    'rpm-build', 'rpmdevtools', 'spectool']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel_tools']
  }
}
