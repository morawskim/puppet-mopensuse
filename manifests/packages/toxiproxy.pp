class mopensuse::packages::toxiproxy (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'toxiproxy':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
