class mopensuse::packages::gui::labplot (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  package { 'labplot':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
