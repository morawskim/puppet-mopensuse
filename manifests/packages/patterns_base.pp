class mopensuse::packages::patterns_base(
  $package_name,
  $ensure = 'present'
) {

  package {$package_name:
    ensure  => $ensure,
  }
}

