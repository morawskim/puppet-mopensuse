class mopensuse::zypper::repositories::virtualization_containers {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::virtualization_containers

  Zypprepo {
    notify => Class['mopensuse::zypper::refresh'],
  }

  ensure_resource(
    'zypprepo',
    'virtualization_containers',
    hiera_hash('mopensuse::zypper::repositories::virtualization_containers')
  )
}
