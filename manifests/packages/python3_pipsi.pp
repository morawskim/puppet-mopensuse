class mopensuse::packages::python3_pipsi (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::python3_devel
  include mopensuse::packages::python3_virtualenv

  package { 'python3-pipsi':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
