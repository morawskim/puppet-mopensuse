class mopensuse::packages::qemu_kvm($ensure = 'present') {

  package {'qemu-kvm':
    ensure => $ensure,
  }
}
