class mopensuse::packages::aspell($ensure = 'present') {
  
  package {['aspell', 'aspell-en', 'aspell-pl']:
    ensure => $ensure,
  }
  
}