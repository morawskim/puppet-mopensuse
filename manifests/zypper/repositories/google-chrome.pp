class mopensuse::zypper::repositories::google-chrome {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "https://dl.google.com/linux/linux_signing_key.pub"
  
  zypprepo {'google-chrome':
    baseurl      => "http://dl.google.com/linux/chrome/rpm/stable/x86_64",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Google chrome repository",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'7FAC5991':
    ensure  => present,
    source  => $gpg_key,
    require => Zypprepo['google-chrome']
  }
  
}
