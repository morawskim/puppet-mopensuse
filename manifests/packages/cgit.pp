class mopensuse::packages::cgit (
  $ensure = 'present'
) {
  include mopensuse::packages::apache2
  include mopensuse::packages::augeas
  include mopensuse::packages::git_server
  include mopensuse::packages::highlight
  include mopensuse::zypper::repositories::morawskim

  package { 'cgit':
    ensure => $ensure,
  }

  package { 'cgit-filter-syntaxhiglight':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

  file { '/var/cache/cgit':
    ensure  => directory,
    mode    => '0750',
    owner   => 'wwwrun',
    group   => 'www',
    require => Class['mopensuse::packages::apache2']
  }
}
