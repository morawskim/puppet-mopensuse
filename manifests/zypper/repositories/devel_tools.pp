class mopensuse::zypper::repositories::devel_tools {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_tools

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'devel_tools',
    hiera_hash('mopensuse::zypper::repositories::devel_tools')
  )
}
