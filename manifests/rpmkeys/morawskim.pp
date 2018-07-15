class mopensuse::rpmkeys::morawskim {

  ensure_resource(
    'rpmkey',
    'morawskim',
    lookup('mopensuse::rpmkeys')['morawskim']
  )
}
