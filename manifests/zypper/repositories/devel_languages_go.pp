class mopensuse::zypper::repositories::devel_languages_go {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_languages_go

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'devel_languages_go',
    hiera_hash('mopensuse::zypper::repositories::devel_languages_go')
  )
}
