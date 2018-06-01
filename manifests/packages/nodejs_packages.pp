class mopensuse::packages::nodejs_packages (
  $ensure = 'present'
) {

  package { 'jshint':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'grunt-cli':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'less':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'jslint':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'localtunnel':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'gulp-cli':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'nativefier':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'http-server':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'bower':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'babel-cli':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'json-server':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'node-inspector':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'stylelint':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'requirejs':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'create-react-app':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'uglify-js':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { '@angular/cli':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'mdncomp':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'caniuse-cmd':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'pwned':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'pageres-cli':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }

  package { 'whistle':
    ensure   => $ensure,
    provider => 'npm',
    require  => Class['mopensuse::packages::nodejs']
  }
}
