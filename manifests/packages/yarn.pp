class mopensuse::packages::yarn (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::yarn

  package { ['yarn']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::yarn']
  }
}
