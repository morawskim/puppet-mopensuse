class mopensuse::zypper::repositories::repo_debug {

  include mopensuse::zypper::refresh
  #include mopensuse::rpmkeys::repo_debug

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    #require => Class['mopensuse::rpmkeys::repo_debug'],
  }

  ensure_resource(
    'zypprepo',
    'repo_debug',
    lookup('mopensuse::zypprepos')['repo_debug']
  )
}
