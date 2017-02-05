class mopensuse::zypper::repositories::debug(
    $enabled = 1
) {
  
  include mopensuse::zypper::refresh

  zypprepo {'debug':
    baseurl      => "http://download.opensuse.org/debug/distribution//${::operatingsystemrelease}/repo/oss/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Debug packages for openSUSE (openSUSE_${::operatingsystemrelease})",
    type         => 'yast2',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
}
