class mopensuse::zypper::repositories::repo_debug_update {

  include mopensuse::zypper::refresh
  #include mopensuse::rpmkeys::repo_debug_update

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    #require => Class['mopensuse::rpmkeys::repo_debug_update'],
  }

  ensure_resource(
    'zypprepo',
    'repo_debug_update',
    lookup('mopensuse::zypprepos')['repo_debug_update']
  )
}
