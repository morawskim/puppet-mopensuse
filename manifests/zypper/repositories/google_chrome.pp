class mopensuse::zypper::repositories::google_chrome {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::google_chrome

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::google_chrome'],
  }

  ensure_resource(
    'zypprepo',
    'google-chrome',
    lookup('mopensuse::zypprepos')['google_chrome']
  )
}
