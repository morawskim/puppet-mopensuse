class mopensuse::packages::o_saft($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'O-Saft':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
