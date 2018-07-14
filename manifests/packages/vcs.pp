class mopensuse::packages::vcs (
  $ensure = 'present'
) {
  package { ['git-svn', 'subversion', 'subversion-bash-completion']:
    ensure => $ensure,
  }
}
