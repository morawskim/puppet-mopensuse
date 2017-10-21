class mopensuse::zypper::repositories::games_tools {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::games_tools

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'games_tools',
    hiera_hash('mopensuse::zypper::repositories::games_tools')
  )
}
