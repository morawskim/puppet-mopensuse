class mopensuse::zypper::repositories::benchmark {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::benchmark

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::benchmark'],
  }

  ensure_resource(
    'zypprepo',
    'benchmark',
    lookup('mopensuse::zypprepos')['benchmark']
  )
}
