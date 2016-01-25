class mopensuse::packages::bash {
  
  package {['bash', 'bash-completion', 'terminfo-base']:
    ensure => present
  }
}