class mopensuse::packages::docker($ensure = 'present') {

    package {'docker':
        ensure => $ensure,
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