class mopensuse::packages::gui::skypeforlinux($ensure = 'present') {

  include mopensuse::zypper::repositories::skype_stable

  package {'skypeforlinux':
      ensure  => 'present',
      require => Class['mopensuse::zypper::repositories::skype_stable'],
  }
}
