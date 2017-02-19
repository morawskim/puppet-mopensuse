class mopensuse::packages::jenkins(
  $port=8880,
  $reverse_proxying=true,
  $service_enable = true,
  $service_ensure = 'running'
) {

  include mopensuse::zypper::repositories::jenkins

  # Manage by class ::jenkins
  #package {'jenkins':
  #  ensure  => present,
  #  require => Class['mopensuse::zypper::repositories::jenkins']
  #}

  # Manage by class ::jenkins
  #service { 'jenkins':
  #  ensure     => 'running',
  #  enable     => true,
  #  hasrestart => true,
  #  hasstatus  => true,
  #  require    => Package['jenkins']
  #}
  
  augeas { "/files/etc/sysconfig/jenkins/JENKINS_PORT":
    changes => [
    "set /files/etc/sysconfig/jenkins/JENKINS_PORT '\"${port}\"'",
    ],
    require => [ Package["augeas"], Package['jenkins'] ],
    notify  => Service['jenkins']
  }
  
  jenkins::plugin { 'phing':
      require => Package['jenkins'],
  }
  
  jenkins::plugin { 'vagrant':
      require => Package['jenkins'],
  }
  
  jenkins::plugin { 'cmakebuilder':
      require => Package['jenkins'],
  }
  
  jenkins::plugin { 'git':
      require => Package['jenkins'],
  }
  
  jenkins::plugin { 'timestamper':
      require => Package['jenkins'],
  }
  
  jenkins::plugin { 'workflow-step-api':
      require => Package['jenkins'],
  }

  jenkins::plugin { 'scm-sync-configuration':
      require => Package['jenkins'],
  }

  # Dependencies for git plugin
  jenkins::plugin { ['credentials', 'mailer', 'scm-api', 'promoted-builds',
      'token-macro', 'parameterized-trigger', 'git-client', 'matrix-project',
      'ssh-credentials']:
      require => Package['jenkins'],
      before  => Jenkins::Plugin['git']
  }

  # More info http://jenkins-php.org/installation.html
  jenkins::plugin { ['checkstyle', 'cloverphp', 'crap4j', 'dry', 'htmlpublisher',
      'jdepend', 'plot', 'pmd', 'violations', 'warnings', 'xunit', 'analysis-core'
      ]:
      require => Package['jenkins'],
  }
  
  class { '::jenkins':
      repo            => false,
      direct_download => undef,
      manage_datadirs => true,
      service_enable  => $service_enable,
      install_java    => false,
      cli             => false,
      service_ensure  => $service_ensure,
      require         => Class['mopensuse::zypper::repositories::jenkins']
  }
  
  host {'jenkins.dev':
      ensure       => present,
      ip           => '127.0.0.1',
      host_aliases => ['www.jenkins.dev']
  }
  
  if $reverse_proxying {
    include mopensuse::packages::apache2
    include mopensuse::services::apache2

    # Require proxy and proxy_http apache's modules
    # Url must end with char "/"
    $jenkins_url="http://localhost:${port}/"
    file {'/etc/apache2/vhosts.d/jenkins.dev.conf':
      ensure  => present,
      mode    => '0744',
      owner   => 'root',
      group   => 'root',
      content => template("${module_name}/jenkins/apache-vhost.erb"),
      require => [ Class['mopensuse::packages::apache2'], Class['::jenkins'] ],
      notify  => Class['mopensuse::services::apache2']
    }
  }
}