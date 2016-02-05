class mopensuse::packages::skype {

   wget::fetch {'download skype':
      source      => 'http://download.skype.com/linux/skype-4.3.0.37-suse.i586.rpm',
      destination => '/tmp/skype-suse.rpm',
      timeout     => 0,
      verbose     => false,
      unless      => 'test -x /usr/bin/skype'
   }
  
   exec {'install skype':
      command => 'zypper -n in --auto-agree-with-licenses /tmp/skype-suse.rpm',
      path    => ['/usr/bin', '/bin'],
      unless  => 'test -x /usr/bin/skype',
      require => Wget::Fetch['download skype']
   }
}