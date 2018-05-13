class mopensuse::packages::pv (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::utilities

  package { 'pv':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::utilities']
  }
}
