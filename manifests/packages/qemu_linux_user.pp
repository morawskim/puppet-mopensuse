class mopensuse::packages::qemu_linux_user (
  $ensure = 'present'
) {

  package { 'qemu-linux-user':
    ensure => $ensure,
  }
}
