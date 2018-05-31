class mopensuse::printers::samsung {

  include mopensuse::packages::cups

  file {'/etc/cups/ppd/samsung-ml2010-gdi.ppd':
    source => 'puppet:///configuration/ppd/samsung-ml-2010-gdi.ppd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    before => Printer['samsung']
  }

  printer { 'samsung':
    ensure      => present,
    uri         => 'http://print.morawskim.pl:631/printers/samsung2010ml',
    description => 'samsung',
    shared      => true,
    ppd         => '/etc/cups/ppd/samsung-ml2010-gdi.ppd',
    require     => Class['mopensuse::packages::cups']
  }

  default_printer { 'samsung':
    ensure  => present,
    require => Printer['samsung'],
  }
}
