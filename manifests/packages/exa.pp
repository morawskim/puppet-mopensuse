class mopensuse::packages::exa($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'exa':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
