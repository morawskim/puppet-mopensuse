class mopensuse::packages::gui::slack {
  
  include mopensuse::zypper::repositories::slack
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::augeas

  # Repository morawskim is require, because slack require packages:
  # libXScrnSaver and libappindicator.
  # morawskim repo provide fake package, because on suse these packages are named
  # respectively libXss1 and libappindicator3-1 
  package{'slack':
    ensure  => present,
    require => [ Class['mopensuse::zypper::repositories::morawskim'], Class['mopensuse::zypper::repositories::slack'] ],
  }
  
  file { '/etc/default/slack':
    ensure  => 'present',
    group   => 'root',
    mode    => '644',
    owner   => 'root',
    require => Package['slack']
  }
  
  augeas { "/files/etc/default/slack/repo_add_once":
    changes => [
    'set /files/etc/default/slack/repo_add_once \'"false"\'',
    ],
    require => [ Package["augeas"], File['/etc/default/slack'] ]
  }
}