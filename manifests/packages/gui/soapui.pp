class mopensuse::packages::gui::soapui($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package { 'SoapUI':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}