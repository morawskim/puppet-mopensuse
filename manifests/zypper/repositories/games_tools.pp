class mopensuse::zypper::repositories::games_tools {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::games_tools

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::games_tools'],
  }

  ensure_resource(
    'zypprepo',
    'games_tools',
    lookup('mopensuse::zypprepos')['games_tools']
  )
}
