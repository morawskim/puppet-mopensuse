class mopensuse::packages::nodejs_packages {

  package { 'jshint':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'grunt-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'less':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'jslint':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'phantomjs':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'localtunnel':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'gulp-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'nativefier':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'http-server':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'bower':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'babel-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'json-server':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'node-inspector':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'stylelint':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'requirejs':
    ensure   => 'present',
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }
}
