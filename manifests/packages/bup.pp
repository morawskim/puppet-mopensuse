class mopensuse::packages::bup(
    $bup_dir='/srv/bup'
) {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::zypper::repositories::devel-languages-python

  package {'bup':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::morawskim'],
        Class['mopensuse::zypper::repositories::devel-languages-python']
    ]
  }

  file { $bup_dir:
    ensure   => directory,
    mode     => '1755',
    owner    => 'root',
    group    => 'root',
    require  => Package['bup']
  }

}