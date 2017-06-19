class mopensuse::packages::fzf_tmux($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::fzf

  package {['fzf-tmux']:
    ensure  => $ensure,
    require => [
      Class['mopensuse::packages::fzf'],
      Class['mopensuse::zypper::repositories::morawskim']
    ]
  }
}
