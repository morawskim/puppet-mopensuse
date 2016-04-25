  class mopensuse::packages::inotify-tools {

    include mopensuse::zypper::repositories::filesystems

    package {'inotify-tools':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::filesystems']
     }

 }