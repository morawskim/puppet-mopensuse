class mopensuse::packages::selenium (
  $ensure = 'present',
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::xvfb

  package { ['selenium', 'selenium-chromedriver']:
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::morawskim'],
      Class['mopensuse::packages::xvfb']
    ]
  }
}
