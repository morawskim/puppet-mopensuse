class mopensuse::packages::mssys($ensure = 'present') {

  include mopensuse::zypper::repositories::packman

    package {'ms-sys':
        ensure  => $ensure,
        require => Class['mopensuse::zypper::repositories::packman']
    }

}
