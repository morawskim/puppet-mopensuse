class mopensuse::packages::gifski($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['gifski']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
