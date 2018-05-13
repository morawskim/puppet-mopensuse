class mopensuse::zypper::repositories::education {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::education

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::education'],
  }

  ensure_resource(
    'zypprepo',
    'education',
    hiera_hash('mopensuse::zypper::repositories::education')
  )
}
