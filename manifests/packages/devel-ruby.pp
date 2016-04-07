class mopensuse::packages::devel-ruby {
  
    package {['patterns-openSUSE-devel_ruby', 'ruby', 'ruby2.1-devel',
        'ruby2.1-devel-extra', 'ruby-devel']:
    ensure => present
  }

}