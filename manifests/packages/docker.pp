class mopensuse::packages::docker($ensure = 'present') {

    include mopensuse::packages::docker_compose

    package {'docker':
        ensure => $ensure,
        before => Class['mopensuse::packages::docker_compose']
    }

    package {'docker-bash-completion':
      ensure  => $ensure,
      require => Package['docker']
    }

    service {'docker':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      require    => Package['docker']
    }
}
