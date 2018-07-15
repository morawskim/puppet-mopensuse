class mopensuse::rpmkeys::virtualization_containers {

  ensure_resource(
    'rpmkey',
    'virtualization_containers',
    lookup('mopensuse::rpmkeys')['virtualization_containers']
  )
}
