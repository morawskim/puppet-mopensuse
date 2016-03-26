class mopensuse::zypper::repositories::server_php_extensions {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://download.opensuse.org/repositories/server:/php:/extensions/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"
  
  zypprepo {'server_php_extensions':
    baseurl      => "http://download.opensuse.org/repositories/server:/php:/extensions/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "PHP extensions (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'DDCD7F1A':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['server_php_extensions']
  }
}