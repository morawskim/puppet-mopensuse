class mopensuse::packages::jenkins {

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
    'set /files/etc/sysconfig/jenkins/JENKINS_PORT \'"8880"\'',
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
      service_enable  => true,
      install_java    => false,
      cli             => false,
      service_ensure  => 'running',
      require         => Class['mopensuse::zypper::repositories::jenkins']
  }
  
  host {'jenkins.dev':
      ensure       => present,
      ip           => '127.0.0.1',
      host_aliases => ['www.jenkins.dev']
  }
}