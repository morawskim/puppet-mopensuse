class mopensuse::packages::composer-packages {
  
  include mopensuse::packages::composer
  include mopensuse::packages::composer-symfony-packages
  
  Package {
    provider => 'composer',
    require  => [Class['mopensuse::packages::composer'], Class['mopensuse::packages::composer-symfony-packages'] ]
  }
  
  package {'phing/phing':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phpdocumentor/phpdocumentor':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'sebastian/phpcpd':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phpmd/phpmd':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phploc/phploc':
    ensure  => '3.0.0',
    provider => 'composer'
  }
  
  package {'phpunit/phpunit':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phpunit/php-code-coverage':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phpunit/dbunit':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'pear/versioncontrol_svn':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'pear/versioncontrol_git':
    ensure  => '*@dev',
    provider => 'composer'
  }
  
  package {'pear/archive_tar':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'tedivm/jshrink':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'michelf/php-markdown':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'erusev/parsedown':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'phpunit/php-invoker':
    ensure  => present,
    provider => 'composer'
  }
  
  package {'squizlabs/php_codesniffer':
    ensure  => present,
    provider => 'composer'
  }
}