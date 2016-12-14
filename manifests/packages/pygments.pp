class mopensuse::packages::pygments {

  include mopensuse::zypper::repositories::devel-languages-python

  package {'python-Pygments':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::devel-languages-python']
  }
}
