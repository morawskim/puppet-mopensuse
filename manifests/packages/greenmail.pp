class mopensuse::packages::greenmail (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['greenmail']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
