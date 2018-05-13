class mopensuse::packages::kiwi (
  $ensure = 'present'
) {
  include mopensuse::packages::kiwi_config_opensuse

  package { ['kiwi', 'kiwi-templates', 'kiwi-tools']:
    ensure => $ensure,
  }
}
