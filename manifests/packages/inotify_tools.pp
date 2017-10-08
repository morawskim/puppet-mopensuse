  class mopensuse::packages::inotify_tools($ensure = 'present') {

    include mopensuse::zypper::repositories::filesystems

    package {'inotify-tools':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::filesystems']
     }

 }
