class mopensuse::packages::gui::telegram (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { 'telegram-desktop':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
