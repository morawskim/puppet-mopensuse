class mopensuse::packages::swaks($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'swaks':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
