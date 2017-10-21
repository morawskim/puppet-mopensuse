class mopensuse::zypper::repositories::morawskim {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::morawskim

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::morawskim'],
  }

  ensure_resource(
    'zypprepo',
    'morawskim',
    hiera_hash('mopensuse::zypper::repositories::morawskim')
  )
}
