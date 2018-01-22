class mopensuse::packages::git_hooks($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {['git-hooks', 'git-hooks-bash-completion']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
