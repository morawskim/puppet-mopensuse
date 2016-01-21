class mopensuse::packages::vcs {
  
  package {['git', 'git-svn', 'subversion', 'subversion-bash-completion']:
    ensure => present
  }
  
}