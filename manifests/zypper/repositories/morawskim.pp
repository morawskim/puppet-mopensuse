class mopensuse::zypper::repositories::morawskim(
    $enabled = 1,
    $url = undef
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }

  if ! $url {
    $baseurl = "http://rpm.morawskim.pl/openSUSE:${::operatingsystemrelease}/"
  } else {
    $baseurl = $url
  }

  include mopensuse::zypper::refresh
  
  zypprepo {'morawskim':
    baseurl      => $baseurl,
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Dodatkowe paczki rpm (${dist_key})",
    gpgcheck     => 0,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
}
