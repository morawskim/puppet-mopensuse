class mopensuse::rpmkeys::virtualization_containers {

  ensure_resource(
    'rpmkey',
    'virtualization_containers',
    hiera_hash('mopensuse::rpmkeys::virtualization_containers')
  )
}
