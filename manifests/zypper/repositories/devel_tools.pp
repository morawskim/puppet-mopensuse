class mopensuse::zypper::repositories::devel_tools {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_tools

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::devel_tools'],
  }

  ensure_resource(
    'zypprepo',
    'devel_tools',
    lookup('mopensuse::zypprepos')['devel_tools']
  )
}
