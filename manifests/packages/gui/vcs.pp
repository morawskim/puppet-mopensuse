class mopensuse::packages::gui::vcs {
  
  package {['gitk', 'kdesvn']:
    ensure => present
  }
  
}