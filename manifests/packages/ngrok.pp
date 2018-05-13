class mopensuse::packages::ngrok (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'ngrok-client':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
