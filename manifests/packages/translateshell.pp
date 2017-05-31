class mopensuse::packages::translateshell($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'translate-shell':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

}