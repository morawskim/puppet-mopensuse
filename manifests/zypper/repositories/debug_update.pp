class mopensuse::zypper::repositories::debug_update(
    $enabled = 1
) {
  
  include mopensuse::zypper::refresh

  zypprepo {'debug_update':
    baseurl      => "http://download.opensuse.org/debug/update/${::operatingsystemrelease}",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Debug packages updates for openSUSE (openSUSE_${::operatingsystemrelease})",
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

}
