class mopensuse::rpmkeys::skype {

  ensure_resource(
    'rpmkey',
    'skype',
    lookup('mopensuse::rpmkeys')['skype']
  )
}
