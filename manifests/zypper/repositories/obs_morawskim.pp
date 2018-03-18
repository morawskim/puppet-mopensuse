class mopensuse::zypper::repositories::obs_morawskim {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::obs_morawskim

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::obs_morawskim'],
  }

  ensure_resource(
    'zypprepo',
    'obs_morawskim',
    hiera_hash('mopensuse::zypper::repositories::obs_morawskim')
  )
}
