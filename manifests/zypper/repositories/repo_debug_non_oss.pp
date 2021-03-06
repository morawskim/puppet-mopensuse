class mopensuse::zypper::repositories::repo_debug_non_oss {

  include mopensuse::zypper::refresh
  #include mopensuse::rpmkeys::repo_debug_non_oss

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
    #require => Class['mopensuse::rpmkeys::repo_debug_non_oss'],
  }

  ensure_resource(
    'zypprepo',
    'repo_debug_non_oss',
    lookup('mopensuse::zypprepos')['repo_debug_non_oss']
  )
}
