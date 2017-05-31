class mopensuse::packages::gui::xclip($ensure = 'present') {
  
  package {['xclip']:
    ensure => $ensure,
  }
  
}