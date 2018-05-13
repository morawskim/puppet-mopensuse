class mopensuse::packages::squashfs (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::filesystems

  package { 'squashfs':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::filesystems']
  }
}
