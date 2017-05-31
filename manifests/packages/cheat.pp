class mopensuse::packages::cheat($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['cheat', 'cheat-bash-completion']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}