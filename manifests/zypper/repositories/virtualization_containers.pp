class mopensuse::zypper::repositories::virtualization_containers {

  include mopensuse::zypper::refresh
  include mopensuse::rpmkeys::virtualization_containers

  Zypprepo {
    notify  => Class['mopensuse::zypper::refresh'],
    require => Class['mopensuse::rpmkeys::virtualization_containers'],
  }

  ensure_resource(
    'zypprepo',
    'virtualization_containers',
    lookup('mopensuse::zypprepos')['virtualization_containers']
  )
}
