class mopensuse::packages::gui::kdeconnect (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::kde_extra

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'kdeconnect-kde'
  } else {
    $packagename = 'kdeconnect-kde4'
  }

  package { $packagename:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}
