class mopensuse::packages::imagemagick (
  $ensure = 'present'
) {

  package { 'ImageMagick':
    ensure => $ensure,
  }
}
