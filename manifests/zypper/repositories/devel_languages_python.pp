class mopensuse::zypper::repositories::devel_languages_python {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::devel_languages_python

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::devel_languages_python'],
  }

  ensure_resource(
    'zypprepo',
    'devel_languages_python',
    hiera_hash('mopensuse::zypper::repositories::devel_languages_python')
  )
}
