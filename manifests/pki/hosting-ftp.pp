class mopensuse::pki::hosting-ftp {

  ca_cert::ca { 'hostinghouse':
    ensure => 'trusted',
    source => "puppet:///modules/${module_name}/CAs/hostinghouse-ftp.pem",
  }
}
