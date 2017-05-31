class mopensuse::packages::enhancd($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['enhancd']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}