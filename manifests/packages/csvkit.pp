class mopensuse::packages::csvkit($ensure = 'present') {

  include mopensuse::zypper::repositories::devel-languages-python

  package {'python-csvkit':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel-languages-python']
  }
}
