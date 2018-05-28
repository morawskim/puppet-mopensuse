class mopensuse::packages::sshd (
  $ensure = 'present'
) {
  include mopensuse::services::sshd

  package { 'openssh':
    ensure => $ensure,
    notify => Class['mopensuse::services::sshd']
  }
}
