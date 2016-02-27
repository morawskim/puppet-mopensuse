class mopensuse::packages::sshfs {
  
  package {['sshfs']:
    ensure => present
  }
  
  #place to mount remote fs
  file {'/srv/sshfs':
    ensure  => directory,
    mode    => '1770',
    owner   => 'root',
    group   => 'users',
    before  => Package['sshfs']
  }
  
}