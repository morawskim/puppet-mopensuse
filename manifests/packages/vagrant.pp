class mopensuse::packages::vagrant(
  $ensure = 'present',
) {
  include mopensuse::zypper::repositories::morawskim

  package {'vagrant':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
