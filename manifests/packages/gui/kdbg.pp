class mopensuse::packages::gui::kdbg (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  package { 'kdbg':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
