class mopensuse::packages::vcs (
  $ensure = 'present'
) {
  include ::git

  package { ['git-svn', 'subversion', 'subversion-bash-completion']:
    ensure => $ensure,
  }
}
