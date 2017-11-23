class mopensuse::packages::netsed($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'netsed':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
