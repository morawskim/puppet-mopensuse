class mopensuse::zypper::repositories::security_privacy {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::security_privacy

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'security_privacy',
    hiera_hash('mopensuse::zypper::repositories::security_privacy')
  )
}
