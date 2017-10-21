class mopensuse::zypper::repositories::server_mail {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_mail

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'server_mail',
    hiera_hash('mopensuse::zypper::repositories::server_mail')
  )
}
