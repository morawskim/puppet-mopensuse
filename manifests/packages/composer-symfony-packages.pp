class mopensuse::packages::composer-symfony-packages {
  
  include mopensuse::packages::composer
  
  Package {
    provider => 'composer',
    require  => Class['mopensuse::packages::composer']
  }
  
  package {'symfony/console':
    ensure   => 'v2.8.3',
    provider => 'composer'
  }
  
  package {'symfony/finder':
    ensure   => 'v2.8.3',
    provider => 'composer'
  }
  
  package {'symfony/config':
    ensure   => 'v2.8.3',
    provider => 'composer'
  }
}