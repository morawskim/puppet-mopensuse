class mopensuse::packages::gui::glogg (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  package { 'glogg':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
