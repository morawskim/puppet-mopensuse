class mopensuse::zypper::repositories::skype(
    $enabled = 1
) {

  include mopensuse::zypper::refresh
  $gpg_key = "https://repo.skype.com/data/SKYPE-GPG-KEY"

  zypprepo {'skype':
    baseurl      => "https://repo.skype.com/rpm/stable/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Skypeforlinux - stable",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'DF7587C3':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['skype']
  }
}
