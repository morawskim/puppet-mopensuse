class mopensuse::packages::bash {
  
  package {['bash', 'bash-completion']:
    ensure => present
  }
}