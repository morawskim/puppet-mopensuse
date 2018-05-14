class mopensuse::config::git_server (
  $dirs
) {
  include mopensuse::packages::git_server

  create_resources(
    'file',
    $dirs,
    {
      'ensure'  => 'directory',
      'require' => Class['mopensuse::packages::git_server'],
    }
  )
}
