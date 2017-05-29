class mopensuse::packages::rpmorphan {

  include mopensuse::zypper::repositories::utilities

  package {'rpmorphan':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::utilities']
  }
}
