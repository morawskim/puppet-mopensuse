class mopensuse::zypper::repositories::kde_kup {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::kde_kup

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'kde_kup',
    hiera_hash('mopensuse::zypper::repositories::kde_kup')
  )
}
