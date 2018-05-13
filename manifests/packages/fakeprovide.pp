class mopensuse::packages::fakeprovide (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'fakeprovide':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
