class mopensuse::packages::nodejs {
  
  package {'nodejs':
    ensure => present
  }
  
  package { 'jshint':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
  
  package { 'grunt-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
  
  package { 'less':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
  
  package { 'jslint':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
  
  package { 'phantomjs':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
  
}