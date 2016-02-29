class mopensuse::packages::aspell {
  
  package {['aspell', 'aspell-en', 'aspell-pl']:
    ensure => present
  }
  
}