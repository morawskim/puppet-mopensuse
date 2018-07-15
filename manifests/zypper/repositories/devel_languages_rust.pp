class mopensuse::zypper::repositories::devel_languages_rust {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_languages_rust

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::devel_languages_rust'],
  }

  ensure_resource(
    'zypprepo',
    'devel_languages_rust',
    lookup('mopensuse::zypprepos')['devel_languages_rust']
  )
}
