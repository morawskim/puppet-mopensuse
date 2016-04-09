class mopensuse::packages::gui::vivaldi {
  
  include mopensuse::zypper::repositories::vivaldi
  include mopensuse::packages::augeas
  
  package{'vivaldi-stable':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::vivaldi'],
  }
  
  file { '/etc/default/vivaldi':
    ensure  => 'present',
    group   => 'root',
    mode    => '644',
    owner   => 'root',
    require => Package['vivaldi-stable']
  }
  
  augeas { "/files/etc/default/vivaldi/repo_add_once":
    changes => [
    'set /files/etc/default/vivaldi/repo_add_once \'"true"\'',
    ],
    require => [ Package["augeas"], File['/etc/default/vivaldi'] ]
  }
}