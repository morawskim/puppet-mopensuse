class mopensuse::packages::patterns_devel_rpm_build(
  $package_name,
  $ensure = 'present'
) {

  package {$package_name:
    ensure  => $ensure,
  }
}

