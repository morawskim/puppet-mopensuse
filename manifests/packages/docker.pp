class mopensuse::packages::docker (
  $ensure = 'present'
) {
  include mopensuse::packages::docker_compose
  include mopensuse::services::docker

  package { 'docker':
    ensure => $ensure,
    before => Class['mopensuse::packages::docker_compose']
  }

  package { 'docker-bash-completion':
    ensure  => $ensure,
    require => Package['docker']
  }
}
