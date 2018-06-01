class mopensuse::packages::libopenssl_1_0_devel(
  $ensure = 'present'
) {

  package {'libopenssl-1_0_0-devel':
    ensure  => $ensure,
    install_options => ['--force-resolution']
  }
}
