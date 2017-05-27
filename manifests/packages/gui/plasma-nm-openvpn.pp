class mopensuse::packages::gui::plasma-nm-openvpn {

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'plasma-nm5-openvpn'
  } else {
    $packagename = 'plasma-nm-openvpn'
  }

  package {$packagename:
    ensure  => present,
  }
}
