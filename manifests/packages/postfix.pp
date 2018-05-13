class mopensuse::packages::postfix (
  $ensure = 'present',
  $sasl_passwd
) {

  include mopensuse::packages::ca_certificates
  #include postfix

  package { ['cyrus-sasl', 'cyrus-sasl-plain']:
    ensure => $ensure,
  }

  exec { 'postfix':
    command     => 'echo "postfix packages are installed"',
    path        => '/usr/sbin:/bin:/usr/bin:/sbin',
    logoutput   => true,
    refreshonly => true,
  }

  package { 'postfix':
    ensure => $ensure,
  }

  service { 'postfix':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['postfix']
  }

  # SASL
  postfix::config::maincfhelper { 'smtpd_sasl_path': value => 'smtpd', }
  postfix::config::maincfhelper { 'smtpd_sasl_auth_enable': value => 'yes', }
  postfix::config::maincfhelper { 'smtp_sasl_password_maps': value => 'hash:/etc/postfix/sasl_passwd', }
  postfix::config::maincfhelper { 'smtp_sasl_type': value => 'cyrus', }
  postfix::config::maincfhelper { 'smtp_sasl_auth_enable': value => 'yes', }
  postfix::config::maincfhelper { 'smtp_sasl_security_options': value => 'noanonymous', }

  #TLS
  postfix::config::maincfhelper { 'smtp_use_tls': value => 'yes', }
  postfix::config::maincfhelper { 'smtp_tls_CAfile': value => '/etc/ssl/ca-bundle.pem', }
  postfix::config::maincfhelper { 'smtp_sasl_tls_security_options': value => 'noanonymous', }

  postfix::config::maincfhelper { 'mydestination': value => "\$myhostname, localhost.\$mydomain, localhost, \$mydomain",
  }
  postfix::config::maincfhelper { 'relayhost': value => 'smtp.gmail.com:587', }

  postfix::config::mastercf { 'tlsmgr':
    ensure       => present,
    type         => 'unix',
    private      => '-',
    unprivileged => '-',
    chroot       => 'n',
    wakeup       => '1000?',
    limit        => '1',
    command      => 'tlsmgr',
    options      => {}
  }

  file_line { 'postfix sasl_passwd':
    path   => '/etc/postfix/sasl_passwd',
    line   => $sasl_passwd,
    notify => Exec['postfix hash sasl_passwd'],
  }

  exec { 'postfix hash sasl_passwd':
    command     => 'postmap hash:/etc/postfix/sasl_passwd',
    path        => ['/usr/sbin/'],
    require     => Package['postfix'],
    notify      => Service['postfix'],
    subscribe   => File_Line['postfix sasl_passwd'],
    refreshonly => true
  }
}
