class mopensuse::packages::smbnetfs (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::filesystems

  package { 'smbnetfs':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::filesystems']
  }
}
