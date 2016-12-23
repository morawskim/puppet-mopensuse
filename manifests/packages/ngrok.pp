class mopensuse::packages::ngrok {

  include mopensuse::zypper::repositories::morawskim

  package { 'ngrok-client':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}