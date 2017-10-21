class mopensuse::zypper::repositories::skype_stable {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::skype

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::skype'],
  }

  ensure_resource(
    'zypprepo',
    'skype',
    hiera_hash('mopensuse::zypper::repositories::skype_stable')
  )
}
