class mopensuse::packages::notify_send (
  $ensure = 'present'
) {

  package { ['libnotify-tools']:
    ensure => $ensure,
  }
}
