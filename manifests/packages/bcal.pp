class mopensuse::packages::bcal (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'bcal':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
