class mopensuse::packages::ntfs3g (
  $ensure = 'present'
) {

  package { 'ntfs-3g':
    ensure => $ensure,
  }

}
