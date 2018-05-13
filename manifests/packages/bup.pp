class mopensuse::packages::bup (
  $ensure  = 'present',
  $bup_dir = '/srv/bup'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'bup':
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::morawskim'],
      Class['mopensuse::zypper::repositories::devel_languages_python']
    ]
  }

  file { $bup_dir:
    ensure  => directory,
    mode    => '1755',
    owner   => 'root',
    group   => 'root',
    require => Package['bup']
  }
}
