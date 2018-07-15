class mopensuse::rpmkeys::education {

  ensure_resource(
    'rpmkey',
    'education',
    lookup('mopensuse::rpmkeys')['education']
  )
}
