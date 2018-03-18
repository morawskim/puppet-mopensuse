class mopensuse::rpmkeys::obs_morawskim {

  ensure_resource(
    'rpmkey',
    'obs_morawskim',
    hiera_hash('mopensuse::rpmkeys::obs_morawskim')
  )
}
