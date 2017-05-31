class mopensuse::packages::kiwi_config_opensuse($ensure = 'present') {

  package {'kiwi-config-openSUSE':
    ensure  => $ensure,
  }
}
