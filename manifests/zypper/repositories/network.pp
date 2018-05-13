class mopensuse::zypper::repositories::network {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::network

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::network'],
  }

  ensure_resource(
    'zypprepo',
    'network',
    hiera_hash('mopensuse::zypper::repositories::network')
  )
}
