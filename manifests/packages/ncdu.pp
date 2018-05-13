class mopensuse::packages::ncdu (
  $ensure = 'present'
) {

  package { 'ncdu':
    ensure => $ensure,
  }
}
