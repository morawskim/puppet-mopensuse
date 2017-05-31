class mopensuse::packages::composer($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'composer':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
