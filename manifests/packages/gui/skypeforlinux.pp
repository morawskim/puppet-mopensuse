class mopensuse::packages::gui::skypeforlinux($ensure = 'present') {

  include mopensuse::zypper::repositories::skype

  package {'skypeforlinux':
      ensure  => 'present',
      require => Class['mopensuse::zypper::repositories::skype'],
  }
}
