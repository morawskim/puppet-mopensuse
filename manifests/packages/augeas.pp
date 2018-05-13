class mopensuse::packages::augeas (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_ruby_extensions

  package { "ruby${::rubydefverion['majversion']}-rubygem-ruby-augeas":
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions'],
    before  => Package['augeas']
  }

  package { 'augeas':
    ensure => $ensure,
  }
}
