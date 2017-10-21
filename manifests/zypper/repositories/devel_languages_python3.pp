class mopensuse::zypper::repositories::devel_languages_python3 {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_languages_python3

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'devel_languages_python3',
    hiera_hash('mopensuse::zypper::repositories::devel_languages_python3')
  )
}
