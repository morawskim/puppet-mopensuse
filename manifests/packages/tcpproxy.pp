class mopensuse::packages::tcpproxy($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'tcpproxy':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
