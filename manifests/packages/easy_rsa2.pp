class mopensuse::packages::easy_rsa2 (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'easy-rsa2':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
