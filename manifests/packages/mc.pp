class mopensuse::packages::mc($ensure = 'present') {

    package {'mc':
        ensure  => $ensure,
    }
}