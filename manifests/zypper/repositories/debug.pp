class mopensuse::zypper::repositories::debug {
  
  include mopensuse::zypper::refresh

  zypprepo {'debug':
    baseurl      => "http://download.opensuse.org/debug/distribution//${::operatingsystemrelease}/repo/oss/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Debug packages for openSUSE (openSUSE_${::operatingsystemrelease})",
    type         => 'yast2',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
}
