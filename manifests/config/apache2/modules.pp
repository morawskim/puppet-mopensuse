class mopensuse::config::apache2::modules() {

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
        ensure => 'present',
        require => A2mod['proxy']
    }

    a2mod { 'proxy_http':
        ensure => 'present',
        require => A2mod['proxy']
    }
}
