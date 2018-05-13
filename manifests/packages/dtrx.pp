class mopensuse::packages::dtrx (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::obs_morawskim

  package { 'dtrx':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::obs_morawskim']
  }
}
