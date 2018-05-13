class mopensuse::packages::live_grub_stick (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::education

  package { 'live-grub-stick':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::education']
  }
}
