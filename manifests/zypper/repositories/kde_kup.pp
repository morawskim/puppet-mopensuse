class mopensuse::zypper::repositories::kde_kup {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::kde_kup

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::kde_kup'],
  }

  ensure_resource(
    'zypprepo',
    'kde_kup',
    hiera_hash('mopensuse::zypper::repositories::kde_kup')
  )
}
