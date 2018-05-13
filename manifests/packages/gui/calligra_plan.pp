class mopensuse::packages::gui::calligra_plan (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  package { 'calligra-plan':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
