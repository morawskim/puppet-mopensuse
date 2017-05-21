class mopensuse::packages::py2pack {

  include mopensuse::zypper::repositories::devel-languages-python

  package {'python-py2pack':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel-languages-python']
  }
}