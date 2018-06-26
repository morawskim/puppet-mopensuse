class mopensuse::user::config::vim (
  $vcsrepo,
  $files
) {

  create_resources(
    'vcsrepo',
    $vcsrepo,
    {}
  )

  create_resources(
    'file',
    $files,
  )
}
