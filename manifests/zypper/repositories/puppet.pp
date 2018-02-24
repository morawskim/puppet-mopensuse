class mopensuse::zypper::repositories::puppet {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::puppet

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::puppet'],
  }

  ensure_resource(
    'zypprepo',
    'puppet',
    hiera_hash('mopensuse::zypper::repositories::puppet')
  )
}
