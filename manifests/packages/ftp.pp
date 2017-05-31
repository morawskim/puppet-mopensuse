class mopensuse::packages::ftp($ensure = 'present') {
  
  package{['lftp', 'curlftpfs']: 
    ensure => present
  }
  
}