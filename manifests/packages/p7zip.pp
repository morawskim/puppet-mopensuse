class mopensuse::packages::p7zip($ensure = 'present') {

  package {'p7zip':
    ensure => $ensure,
  }
}
