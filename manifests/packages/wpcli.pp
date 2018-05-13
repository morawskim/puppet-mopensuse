class mopensuse::packages::wpcli (
  $ensure = 'present'
) {

  wget::fetch { 'download wpcli':
    source      => 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar',
    destination => '/usr/local/bin/wp',
    timeout     => 0,
    verbose     => false,
    unless      => 'test -x /usr/local/bin/wp'
  }

  file { '/usr/local/bin/wp':
    ensure  => present,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Wget::Fetch['download wpcli']
  }

  wget::fetch { 'download wpcli bash completion':
    source      => 'https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash',
    destination => '/etc/bash_completion.d/wp-cli.sh',
    timeout     => 0,
    verbose     => false,
    unless      => 'test -r /etc/bash_completion.d/wp-cli.sh'
  }

  file { '/etc/bash_completion.d/wp-cli.sh':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Wget::Fetch['download wpcli bash completion']
  }
}
