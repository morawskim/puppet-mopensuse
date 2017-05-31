class mopensuse::packages::sqlite3-devel($ensure = 'present') {
    
    package {'sqlite3-devel':
        ensure => $ensure,
    }
    
}