class mopensuse::packages::offlineimap (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::server_mail

  package { 'offlineimap':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::server_mail']
  }
}
