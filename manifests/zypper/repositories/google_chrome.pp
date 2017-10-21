class mopensuse::zypper::repositories::google_chrome {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::google_chrome

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'google-chrome',
    hiera_hash('mopensuse::zypper::repositories::google_chrome')
  )
}
