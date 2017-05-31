class mopensuse::packages::puppet($ensure = 'present') {

  ini_setting { "puppet stringify_facts":
    ensure  => present,
    path    => "/etc/puppet/puppet.conf",
    section => 'main',
    setting => 'stringify_facts',
    value   => 'false',
  }
}