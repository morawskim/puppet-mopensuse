class mopensuse::packages::git_extras (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['git-extras']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
