class mopensuse::zypper::repositories::morawskim {
  
  zypprepo {'morawskim':
    baseurl      => "http://rpm.morawskim.pl/openSUSE:${::operatingsystemrelease}/",
    enabled      => 1,
    autorefresh  => 1,
    descr        => "Dodatkowe paczki rpm (openSUSE_${::operatingsystemrelease})",
    gpgcheck     => 0,
    type         => 'rpm-md',
  }
}