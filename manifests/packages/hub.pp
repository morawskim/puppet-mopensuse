class mopensuse::packages::hub (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'hub':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
