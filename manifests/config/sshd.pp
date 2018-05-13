class mopensuse::config::sshd () {
  include mopensuse::packages::augeas
  include mopensuse::packages::sshd
  include mopensuse::services::sshd

  Augeas {
    require => [
      Class['mopensuse::packages::augeas'],
      Class['mopensuse::packages::sshd'],
    ]
  }

  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      'set PermitRootLogin no',
      'set Protocol 2',
      'set PasswordAuthentication no'
    ],
    notify  => Class['mopensuse::services::sshd']
  }
}
