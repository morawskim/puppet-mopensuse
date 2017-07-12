class mopensuse::packages::docker_compose($ensure = 'present') {

  package {'docker-compose':
    ensure          => $ensure,
  }
}
