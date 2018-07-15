class mopensuse::zypper::repositories::vivaldi {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::vivaldi
  include mopensuse::rpmkeys::vivaldi_future

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => [ Class['mopensuse::rpmkeys::vivaldi'], Class['mopensuse::rpmkeys::vivaldi_future'] ],
  }

  ensure_resource(
    'zypprepo',
    'vivaldi',
    lookup('mopensuse::zypprepos')['vivaldi']
  )
}
