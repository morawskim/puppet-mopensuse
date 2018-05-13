class mopensuse::printers::samsung {

  include mopensuse::packages::cups

  wget::fetch { "/etc/cups/ppd/samsung-ml2010-gdi.ppd":
    source      => 'http://openprinting.org/ppd-o-matic.php?driver=gdi&printer=samsung-ml-2010&show=0',
    destination => '/etc/cups/ppd/samsung-ml2010-gdi.ppd',
    timeout     => 0,
    verbose     => false,
    before      => Printer['samsung']
  }

  printer {"samsung":
    ensure      => present,
    uri         => "http://print.morawskim.pl:631/printers/samsung2010ml",
    description => "samsung",
    shared      => true,
    ppd         => "/etc/cups/ppd/samsung-ml2010-gdi.ppd",
    require     => Class['mopensuse::packages::cups']
  }

  default_printer { "samsung":
    ensure => present,
    require => Printer['samsung'],
  }

}
