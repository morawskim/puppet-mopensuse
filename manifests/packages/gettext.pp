class mopensuse::packages::gettext (
  $ensure = 'present'
) {

  package { ['gettext-tools', 'gettext-runtime']:
    ensure => $ensure,
  }
}
