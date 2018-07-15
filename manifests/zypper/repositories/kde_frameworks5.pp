class mopensuse::zypper::repositories::kde_frameworks5 {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::kde_frameworks5

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::kde_frameworks5'],
  }

  ensure_resource(
    'zypprepo',
    'kde_frameworks5',
    lookup('mopensuse::zypprepos')['kde_frameworks5']
  )
}
