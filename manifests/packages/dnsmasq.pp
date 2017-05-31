class mopensuse::packages::dnsmasq($ensure = 'present') {

  include mopensuse::packages::libcap_progs

  package {['dnsmasq']:
    ensure => $ensure,
  }

  file_capability { '/usr/sbin/dnsmasq':
    ensure     => present,
    capability => 'cap_net_bind_service=ep',
    require    => [
      Class['mopensuse::packages::libcap_progs'],
      Package['dnsmasq']
    ],
  }
}
