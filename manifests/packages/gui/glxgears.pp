class mopensuse::packages::gui::glxgears($ensure = 'present') {
    
    package { 'Mesa-demo-x':
        ensure  => $ensure,
    }
    
}

