class mopensuse::user::config::dirs (
  $dirs
) {
  create_resources(
    'file',
    $dirs,
    { ensure => 'directory' }
  )
}
