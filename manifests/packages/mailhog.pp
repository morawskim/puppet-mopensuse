class mopensuse::packages::mailhog (
  $ensure = 'present'
) {
  include mopensuse::packages::firewall

  package { 'mailhog':
    ensure => $ensure
  }
}
