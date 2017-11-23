class mopensuse::packages::git_crypt($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'git-crypt':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
