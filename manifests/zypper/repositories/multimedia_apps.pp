class mopensuse::zypper::repositories::multimedia_apps {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::multimedia_apps

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::multimedia_apps'],
  }

  ensure_resource(
    'zypprepo',
    'multimedia_apps',
    hiera_hash('mopensuse::zypper::repositories::multimedia_apps')
  )
}
