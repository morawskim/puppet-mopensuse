class mopensuse::zypper::repositories::ruby_extensions(
    $enabled = 1
) {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'devel_languages_ruby_extensions':
    baseurl      => "http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_${::operatingsystemrelease}/",
    enabled      => $enabled,
    autorefresh  => 0,
    descr        => "Ruby Extensions (openSUSE_${::operatingsystemrelease})",
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
