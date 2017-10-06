class mopensuse::packages::xdebug_tmpfiles($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['xdebug-tmpfiles']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
