class mopensuse::user::nobody {
  
  user { 'nobody':
    ensure  => 'present',
    comment => 'nobody',
    gid     => 'nobody',
    groups  => ['nogroup'],
    home    => '/var/lib/nobody',
    shell   => '/bin/bash',
  }

}
