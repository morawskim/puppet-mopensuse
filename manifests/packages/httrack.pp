class mopensuse::packages::httrack (
  $ensure = 'present'
) {

  package { 'httrack':
    ensure => $ensure,
  }
}
