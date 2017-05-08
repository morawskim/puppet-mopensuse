class mopensuse::packages::git_extras {

  include mopensuse::zypper::repositories::morawskim

  package {['git-extras']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}