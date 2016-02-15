class mopensuse::packages::httrack {

  $file = "ftp://rpmfind.net/linux/opensuse/distribution/${::operatingsystemrelease}/repo/oss/suse/${::architecture}/httrack-3.48.19-2.1.4.x86_64.rpm"
  
   wget::fetch {'download httrack':
      source      => $file,
      destination => '/tmp/httrack-suse.rpm',
      timeout     => 0,
      verbose     => false,
      unless      => 'test -x /usr/bin/httrack'
   }
  
   exec {'install httrack':
      command => 'zypper -n in --auto-agree-with-licenses /tmp/httrack-suse.rpm',
      path    => ['/usr/bin', '/bin'],
      unless  => 'test -x /usr/bin/httrack',
      require => Wget::Fetch['download httrack']
   }
}


