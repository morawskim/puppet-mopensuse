class mopensuse::zypper::repositories::jenkins {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::jenkins

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'jenkins',
    hiera_hash('mopensuse::zypper::repositories::jenkins')
  )
}
