class mopensuse::zypper::repositories::packman {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::packman

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'packman',
    hiera_hash('mopensuse::zypper::repositories::packman')
  )
}
