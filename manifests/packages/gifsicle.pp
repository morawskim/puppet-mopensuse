class mopensuse::packages::gifsicle (
  $ensure = 'present'
) {

  package { 'gifsicle':
    ensure => $ensure,
  }
}
