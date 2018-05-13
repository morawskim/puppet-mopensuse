class mopensuse::packages::hstr (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'hstr':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
