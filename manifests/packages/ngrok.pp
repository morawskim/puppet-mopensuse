class mopensuse::packages::ngrok {

  file {'/usr/local/bin/ngrok':
    ensure  => present,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Archive['ngrok']
  }

  archive {'ngrok':
    ensure    => present,
    url       => 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip',
    target    => '/usr/local/bin',
    extension => 'zip',
    checksum  => false,
  }
}