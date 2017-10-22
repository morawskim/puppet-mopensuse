class mopensuse::packages::augeas($ensure = 'present') {

  include mopensuse::zypper::repositories::devel_languages_ruby_extensions

  package{'ruby2.1-rubygem-ruby-augeas':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions']
  }

  package {'augeas':
    ensure => $ensure,
    require => Package['ruby2.1-rubygem-ruby-augeas']
  }
}
