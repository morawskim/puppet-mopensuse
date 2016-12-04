class mopensuse::packages::nodejs {

  package {'nodejs':
    ensure => present
  }

  package {'nodejs-devel':
    ensure  => present,
    require => Package['nodejs']
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

  package { 'localtunnel':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'gulp-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'nativefier':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'http-server':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'bower':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'babel-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }

  package { 'json-server':
    ensure   => 'present',
    provider => 'npm',
    require  => Package['nodejs']
  }
}