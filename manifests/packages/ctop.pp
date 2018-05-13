class mopensuse::packages::ctop (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['ctop']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
