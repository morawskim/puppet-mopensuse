class mopensuse::zypper::repositories::server_mail {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::server_mail

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::server_mail'],
  }

  ensure_resource(
    'zypprepo',
    'server_mail',
    lookup('mopensuse::zypprepos')['server_mail']
  )
}
