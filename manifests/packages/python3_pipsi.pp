class mopensuse::packages::python3_pipsi($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'python3-pipsi':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
