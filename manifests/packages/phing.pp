class mopensuse::packages::phing (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'phing':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
