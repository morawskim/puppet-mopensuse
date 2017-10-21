class mopensuse::rpmkeys::systemsmanagement_machinery {

  ensure_resource(
    'rpmkey',
    'systemsmanagement_machinery',
    hiera_hash('mopensuse::rpmkeys::systemsmanagement_machinery')
  )
}
