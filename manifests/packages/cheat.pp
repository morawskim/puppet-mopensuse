class mopensuse::packages::cheat {

  include mopensuse::zypper::repositories::morawskim

  package {['cheat', 'cheat-bash-completion']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}