class mopensuse::packages::monoid (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'monoid':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
