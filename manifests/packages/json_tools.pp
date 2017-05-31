class mopensuse::packages::json_tools($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package { 'json-tools':
      ensure  => $ensure,
      require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
