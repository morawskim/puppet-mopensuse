class mopensuse::packages::augeas {
  
  include mopensuse::zypper::repositories::ruby_extensions
  
  package{'ruby2.1-rubygem-ruby-augeas':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::ruby_extensions']
  }
  
  package {'augeas':
    ensure => present,
    require => Package['ruby2.1-rubygem-ruby-augeas']
  }
}