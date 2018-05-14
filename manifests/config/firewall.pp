class mopensuse::config::firewall {
  include mopensuse::packages::firewall
  include mopensuse::packages::augeas

  augeas { '/files/etc/sysconfig/SuSEfirewall2/FW_ROUTE':
    changes => [
      'set /files/etc/sysconfig/SuSEfirewall2/FW_ROUTE \'"yes"\'',
    ],
    require => [ Class['mopensuse::packages::firewall'], Class['mopensuse::packages::augeas'] ]
  }
}
