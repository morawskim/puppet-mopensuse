class mopensuse::packages::fzf (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::morawskim

  package { ['fzf', 'fzf-bash-completion', 'fzf-vim']:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
