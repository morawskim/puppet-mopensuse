class mopensuse::packages::fzf {

  include mopensuse::zypper::repositories::morawskim

  package {['fzf', 'fzf-bash-completion', 'fzf-vim']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}