class mopensuse::packages::mssys {

  include mopensuse::zypper::repositories::packman

    package {'ms-sys':
        ensure  => present,
        require => Class['mopensuse::zypper::repositories::packman']
    }

}
