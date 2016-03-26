class mopensuse::zypper::repositories::games_tools {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/games:/tools/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'games_tools':
      baseurl      => "http://download.opensuse.org/repositories/games:/tools/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Tools for Gamers (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'58DDEB32':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['games_tools']
  }
  
}
