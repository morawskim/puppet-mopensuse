class mopensuse::zypper::repositories::vivaldi {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::vivaldi

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'vivaldi',
    hiera_hash('mopensuse::zypper::repositories::vivaldi')
  )
}
