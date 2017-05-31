class mopensuse::packages::sslscan($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'sslscan':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

}