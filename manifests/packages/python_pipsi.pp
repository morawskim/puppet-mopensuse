class mopensuse::packages::python_pipsi($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::python_devel
  include mopensuse::packages::python_virtualenv

  package {'python-pipsi':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
