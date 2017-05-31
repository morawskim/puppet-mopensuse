class mopensuse::packages::gui::plasma-nm-openvpn($ensure = 'present') {

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'plasma-nm5-openvpn'
  } else {
    $packagename = 'plasma-nm-openvpn'
  }

  package {$packagename:
    ensure  => $ensure,
  }
}
