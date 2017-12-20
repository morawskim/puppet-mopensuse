class mopensuse::packages::qemu_arm($ensure = 'present') {

  package {'qemu-arm':
    ensure => $ensure,
  }
}
