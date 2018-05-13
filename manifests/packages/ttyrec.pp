class mopensuse::packages::ttyrec (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::utilities

  package { 'ttyrec':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::utilities']
  }
}
