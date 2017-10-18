class mopensuse::packages::python_pipsi($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'python-pipsi':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
