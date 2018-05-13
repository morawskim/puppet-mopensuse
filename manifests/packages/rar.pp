class mopensuse::packages::rar (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::packman

  package { 'rar':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::packman']
  }
}
