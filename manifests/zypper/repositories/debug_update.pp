class mopensuse::zypper::repositories::debug_update(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
    $path = "leap/${::operatingsystemrelease}/oss"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
    $path = "${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  zypprepo {'debug_update':
    baseurl      => "http://download.opensuse.org/debug/update/${path}",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Debug packages updates for openSUSE (${dist_key})",
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

}
