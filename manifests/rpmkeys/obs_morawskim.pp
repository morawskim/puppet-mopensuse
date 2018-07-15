class mopensuse::rpmkeys::obs_morawskim {

  ensure_resource(
    'rpmkey',
    'obs_morawskim',
    lookup('mopensuse::rpmkeys')['obs_morawskim']
  )
}
