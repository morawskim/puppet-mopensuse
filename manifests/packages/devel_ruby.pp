class mopensuse::packages::devel_ruby($ensure = 'present') {
  
    include mopensuse::zypper::repositories::devel_languages_ruby_extensions
    include mopensuse::zypper::repositories::morawskim
    include mopensuse::packages::valgrind_devel
    include mopensuse::packages::apache2
    include mopensuse::services::apache2
    include mopensuse::packages::bundler
    include mopensuse::packages::ruby_build
    
    package {['patterns-openSUSE-devel_ruby', 'ruby', 'ruby2.1-devel',
        'ruby2.1-devel-extra', 'ruby-devel', 'rubygem-passenger',
        'rubygem-passenger-apache2', 'completion-ruby',
        'ruby2.1-rubygem-ruby-debug-ide', 'ruby2.1-rubygem-gem2rpm', 'rbenv'
    ]:
    ensure  => $ensure,
    require => [
        Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions'],
        Class['mopensuse::zypper::repositories::morawskim']
    ]
  }

  package{'debase':
    provider => 'gem',
    ensure   => 'installed',
    require  => [
        Package['debugger-ruby_core_source'],
        Class['mopensuse::packages::valgrind_devel']
        ]
    #/usr/include/ruby-2.1.0
  }
  
  package{['fpm', 'faker', 'faker-cli']:
      provider => 'gem',
      ensure   => 'installed',
      require  => Package['ruby']
  }

  package{['rbtrace', 'byebug']:
      provider => 'gem',
      ensure   => 'installed',
      require  => Package['ruby']
  }

  package{['rubocop', 'rubycritic', 'bundler-audit', 'dawnscanner', 'simplecov']:
      provider => 'gem',
      ensure   => 'installed',
      require  => Package['ruby']
  }

  package {'debugger-ruby_core_source':
      provider => 'gem',
      ensure   => $ensure,
      require  => Package['ruby']
  }
  
  file {'/etc/apache2/vhosts.d/vhost-modpassenger.template':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      source  => "puppet:///modules/${module_name}/devel-ruby/vhost-modpassenger.template",
      require => Class['mopensuse::packages::apache2']
  }
  
  exec {'enable_apache_mod_passenger':
      command => 'a2enmod passenger',
      unless  => 'a2enmod -q passenger',
      path    => ['/usr/sbin/'],
      require => [ Class['mopensuse::packages::apache2'], Package['rubygem-passenger-apache2'] ],
      notify  => Class['mopensuse::services::apache2'] 
  }
  
}
