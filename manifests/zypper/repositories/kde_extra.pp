class mopensuse::zypper::repositories::kde_extra(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/KDE:/Extra/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'kde_extra':
    baseurl      => "http://download.opensuse.org/repositories/KDE:/Extra/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Additional packages maintained by the KDE team (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  # The same key is use in kde_qt repository
  if ! defined(Rpmkey['0D210A40']) {
      rpmkey {'0D210A40':
          ensure  => present,
          source  => $gpg_key,
          before  => Zypprepo['kde_extra']
      }
  }
}
