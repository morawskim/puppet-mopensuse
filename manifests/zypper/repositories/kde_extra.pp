class mopensuse::zypper::repositories::kde_extra {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'kde_extra':
    baseurl      => "http://download.opensuse.org/repositories/KDE:/Extra/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Additional packages maintained by the KDE team (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'6F88BB2F':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['kde_extra']
  }
  
}
