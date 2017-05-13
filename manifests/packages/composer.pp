class mopensuse::packages::composer() {

  include mopensuse::zypper::repositories::morawskim

  package {'composer':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}