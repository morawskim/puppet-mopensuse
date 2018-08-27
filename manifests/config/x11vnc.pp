class mopensuse::config::x11vnc (
  $files,
  $vnc_password
) {
  include ::systemd

  file { '/etc/x11vnc.pass':
    ensure  => present,
    content => vncpassword($vnc_password),
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => [ File['/usr/local/bin/x11vnc-wrapper'] ],
    notify  => Service['x11vnc']
  }

  create_resources(
    'file',
    $files,
    {
      'ensure' => 'present',
      'notify' => Exec['systemctl-daemon-reload']
    }
  )
}
