class mopensuse::packages::yum_scripts (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'yum-scripts':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
