class mopensuse::packages::osc($ensure = 'present') {

  package {'osc':
    ensure => $ensure,
  }

  group { 'osc':
    ensure  => 'present',
    system     => true,
  }

  file { '/etc/sudoers.d/osc':
    ensure  => present,
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/osc/sudoers",
  }
}
