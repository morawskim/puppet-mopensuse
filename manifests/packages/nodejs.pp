class mopensuse::packages::nodejs {
  
  exec{'install_grunt_cli':
    command => 'npm install -g grunt-cli',
    unless  => 'npm list -g grunt-cli',
    path    => ['/usr/bin/'],
    require => Package['nodejs']
  }
  
  package {'nodejs':
    ensure => present
  }
}