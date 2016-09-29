class mopensuse::zypper::repositories::benchmark {

  include mopensuse::zypper::refresh

  $gpg_key = "http://download.opensuse.org/repositories/benchmark/openSUSE_${::operatingsystemrelease}/repodata/repomd.xml.key"

  zypprepo {'benchmark':
    baseurl      => "http://download.opensuse.org/repositories/benchmark/openSUSE_${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Benchmarks (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'9F1AEE68':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['benchmark']
  }
}
