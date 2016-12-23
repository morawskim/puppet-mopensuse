class mopensuse::packages::gui::soapui {

  include mopensuse::zypper::repositories::morawskim

  package { 'SoapUI':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}