class mopensuse::zypper::repositories::google_chrome(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "https://dl.google.com/linux/linux_signing_key.pub"
  
  zypprepo {'google-chrome':
    baseurl      => "http://dl.google.com/linux/chrome/rpm/stable/x86_64",
    enabled      => $enabled,
    autorefresh  => 0,
    descr        => "Google chrome repository",
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'7FAC5991':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['google-chrome']
  }
}
