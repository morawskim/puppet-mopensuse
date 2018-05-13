class mopensuse::packages::gui::chrome (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::google_chrome

  package { 'google-chrome-stable':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::google_chrome'],
  }
}
