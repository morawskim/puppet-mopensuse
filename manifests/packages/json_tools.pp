class mopensuse::packages::json_tools {

  include mopensuse::zypper::repositories::morawskim

  package { 'json-tools':
      ensure  => present,
      require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
