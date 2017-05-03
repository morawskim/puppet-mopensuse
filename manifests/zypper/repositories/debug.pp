class mopensuse::zypper::repositories::debug(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
    $path = "leap/${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
    $path = "${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  zypprepo {'debug':
    baseurl      => "http://download.opensuse.org/debug/distribution/${path}/repo/oss/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Debug packages for openSUSE (${dist_key})",
    type         => 'yast2',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
}
