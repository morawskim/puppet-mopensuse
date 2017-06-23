class mopensuse::packages::gui::kio_gdrive($ensure = 'present') {

  include mopensuse::zypper::repositories::kde_extra

  package {'kio-gdrive':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}

