class mopensuse::packages::nullmailer (
  $ensure = 'present',
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['nullmailer']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
