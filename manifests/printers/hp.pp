class mopensuse::printers::hp {

  include mopensuse::packages::cups

  package { 'hplip-hpijs':
    ensure => present
  }

  printer { 'hp':
    ensure      => present,
    uri         => 'socket://192.168.15.10',
    description => 'hp laserjet 2300',
    shared      => true,
    ppd         => '/usr/share/cups/model/manufacturer-PPDs/hplip/hp-laserjet_2300_series-hpijs.ppd.gz',
    require     => [ Class['mopensuse::packages::cups'], Package['hplip-hpijs'] ]
  }
}
