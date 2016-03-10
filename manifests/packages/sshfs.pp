class mopensuse::packages::sshfs {
  
  package {['sshfs']:
    ensure => present
  }
  
  group {'sshfs':
    ensure => present,
    system     => true
  }
  
  #place to mount remote fs
  file {'/srv/sshfs':
    ensure  => directory,
    mode    => '1770',
    owner   => 'root',
    group   => 'sshfs',
    before  => Package['sshfs'],
    require => Group['sshfs']
  }
}