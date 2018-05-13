class mopensuse::packages::httpry (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::network_utilities

  package { 'httpry':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::network_utilities']
  }
}
