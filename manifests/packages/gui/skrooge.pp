class mopensuse::packages::gui::skrooge (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  package { 'skrooge':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
