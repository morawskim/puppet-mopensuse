class mopensuse::zypper::repositories::devel_languages_ruby_extensions {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_languages_ruby_extensions

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::devel_languages_ruby_extensions'],
  }

  ensure_resource(
    'zypprepo',
    'devel_languages_ruby_extensions',
    hiera_hash('mopensuse::zypper::repositories::devel_languages_ruby_extensions')
  )
}
