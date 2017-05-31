class mopensuse::packages::tmux($ensure = 'present') {
  
  package {['tmux']:
    ensure => $ensure,
  }
  
}