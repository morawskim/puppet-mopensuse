class mopensuse::packages::translateshell {

  include mopensuse::zypper::repositories::morawskim

  package {'translate-shell':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

}