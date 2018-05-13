class mopensuse::packages::smtpcli (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'smtp-cli':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
