class mopensuse::packages::dpkg (
  $ensure = 'present'
) {

  package { 'dpkg':
    ensure => $ensure,
  }
}
