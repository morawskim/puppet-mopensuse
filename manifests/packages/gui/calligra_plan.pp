class mopensuse::packages::gui::calligra_plan {

  include mopensuse::zypper::repositories::kde_extra

  package {'calligra-plan':
    ensure => present,
    require => Class['mopensuse::zypper::repositories::kde_extra']
  }
}