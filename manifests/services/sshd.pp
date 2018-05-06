class mopensuse::services::sshd {
  include mopensuse::packages::sshd

  service {'sshd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::sshd']
  }
}
