class mopensuse::zypper::repositories::slack {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::slack

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::slack'],
  }

  ensure_resource(
    'zypprepo',
    'slack',
    lookup('mopensuse::zypprepos')['slack']
  )
}
