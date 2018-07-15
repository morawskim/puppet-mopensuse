class mopensuse::zypper::repositories::games {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::games

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::games'],
  }

  ensure_resource(
    'zypprepo',
    'games',
    lookup('mopensuse::zypprepos')['games']
  )
}
