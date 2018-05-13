class mopensuse::packages::python3_docopt (
  $ensure = 'present'
) {

  package { 'python3-docopt':
    ensure => $ensure,
  }
}
