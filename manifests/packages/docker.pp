class mopensuse::packages::docker {

    package {'docker':
        ensure => present
    }

    package {'docker-bash-completion':
      ensure  => present,
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