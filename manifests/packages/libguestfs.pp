class mopensuse::packages::libguestfs (
  $ensure = 'present'
) {

  package { ['libguestfs0', 'guestfs-tools']:
    ensure => $ensure,
  }
}
