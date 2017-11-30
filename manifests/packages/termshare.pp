class mopensuse::packages::termshare($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['termshare']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
