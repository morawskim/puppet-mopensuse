class mopensuse::packages::packer($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['packer']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
