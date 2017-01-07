class mopensuse::packages::smbnetfs {

  include mopensuse::zypper::repositories::filesystems

  package {'smbnetfs':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::filesystems']
  }
}