class mopensuse::zypper::repositories::jenkins {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "http://pkg.jenkins-ci.org/opensuse/repodata/repomd.xml.key"
  
  zypprepo {'jenkins':
    baseurl      => "http://pkg.jenkins-ci.org/opensuse/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Jenkins",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'D50582E6':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['jenkins']
  }
}
