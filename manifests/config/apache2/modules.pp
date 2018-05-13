class mopensuse::config::apache2::modules () {

  include mopensuse::packages::apache2

  A2mod {
    require => Class['mopensuse::packages::apache2'],
    notify  => Class['mopensuse::services::apache2'],
  }

  a2mod { 'php5':
    ensure => 'absent'
  }

  a2mod { 'proxy':
    ensure => 'present'
  }

  a2mod { 'ssl':
    ensure => 'present'
  }

  a2mod { 'rewrite':
    ensure => 'present'
  }

  a2mod { 'userdir':
    ensure => 'present'
  }

  a2mod { 'version':
    ensure => 'present'
  }

  a2mod { 'headers':
    ensure => 'present'
  }

  a2mod { 'filter':
    ensure => 'present'
  }

  a2mod { 'deflate':
    ensure => 'present'
  }

  a2mod { 'proxy_fcgi':
    ensure  => 'present',
    require => A2mod['proxy']
  }

  a2mod { 'proxy_http':
    ensure  => 'present',
    require => A2mod['proxy']
  }
}
