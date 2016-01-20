class mopensuse::packages::ftp {
  
  package{['lftp', 'curlftpfs']: 
    ensure => present
  }
  
}