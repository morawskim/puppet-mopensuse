class mopensuse::zypper::repositories::kde_extra {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::kde_extra

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'kde_extra',
    hiera_hash('mopensuse::zypper::repositories::kde_extra')
  )
}
