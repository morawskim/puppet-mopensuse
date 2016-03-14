class mopensuse::packages::vcs {
  
  include ::git
  
  package {['git-svn', 'subversion', 'subversion-bash-completion']:
    ensure => present
  }
  
}