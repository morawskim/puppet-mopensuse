class mopensuse::packages::fontawesome (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['fontawesome-fonts', 'fontawesome-fonts-web']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
