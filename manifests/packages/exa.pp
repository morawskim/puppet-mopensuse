class mopensuse::packages::exa($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['exa', 'exa-bash-completion']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
