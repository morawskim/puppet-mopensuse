class mopensuse::packages::rpmorphan($ensure = 'present') {

  include mopensuse::zypper::repositories::utilities

  package {'rpmorphan':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::utilities']
  }
}
