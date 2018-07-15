class mopensuse::zypper::repositories::yarn {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::yarn

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::yarn'],
  }

  ensure_resource(
    'zypprepo',
    'yarn',
    lookup('mopensuse::zypprepos')['yarn']
  )
}
