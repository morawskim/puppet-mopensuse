class mopensuse::sysctl::inotify {

    include mopensuse::packages::filesystem

    file {'/etc/sysctl.d/60-inotify.conf':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/${module_name}/sysctl/60-inotify.conf",
        require => Class['mopensuse::packages::filesystem']
    }
}