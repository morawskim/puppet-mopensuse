class mopensuse::rpmkeys::systemsmanagement_machinery {

  ensure_resource(
    'rpmkey',
    'systemsmanagement_machinery',
    lookup('mopensuse::rpmkeys')['systemsmanagement_machinery']
  )
}
