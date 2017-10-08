class mopensuse::packages::sqlite3_devel($ensure = 'present') {
    
    package {'sqlite3-devel':
        ensure => $ensure,
    }
    
}
