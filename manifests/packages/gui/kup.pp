class mopensuse::packages::gui::kup (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_kup

  package { 'kup':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_kup']
  }
}
