class mopensuse::zypper::repositories::systemsmanagement_machinery {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::systemsmanagement_machinery

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::systemsmanagement_machinery'],
  }

  ensure_resource(
    'zypprepo',
    'systemsmanagement_machinery',
    hiera_hash('mopensuse::zypper::repositories::systemsmanagement_machinery')
  )
}
