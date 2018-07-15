class mopensuse::zypper::repositories::packman {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::packman

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::packman'],
  }

  ensure_resource(
    'zypprepo',
    'packman',
    lookup('mopensuse::zypprepos')['packman']
  )
}
