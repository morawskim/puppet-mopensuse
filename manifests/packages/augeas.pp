class mopensuse::packages::augeas (
  $ensure = 'present'
) {

  package { "ruby${::rubydefverion['majversion']}-rubygem-ruby-augeas":
    ensure  => present,
    before  => Package['augeas']
  }

  package { 'augeas':
    ensure => $ensure,
  }
}
