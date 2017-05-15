class mopensuse::packages::squashfs {

  include mopensuse::zypper::repositories::filesystems

  package {'squashfs':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::filesystems']
  }
}