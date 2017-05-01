class mopensuse::zypper::repositories::ruby_extensions(
    $enabled = 1
) {
  
  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/${dist_key}/repodata/repomd.xml.key"
  
  zypprepo {'devel_languages_ruby_extensions':
    baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/${dist_key}/",
    enabled      => $enabled,
    autorefresh  => 0,
    descr        => "Ruby Extensions (${dist_key})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'0E9AF123':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['devel_languages_ruby_extensions']
  }
}
