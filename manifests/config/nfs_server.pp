class mopensuse::config::nfs_server (
  $exports
) {
  include mopensuse::packages::nfs_server

  create_resources(
    'file',
    $exports,
    {
      'ensure'  => 'directory',
      'require' => Class['mopensuse::packages::nfs_server'],
    }
  )

  # todo mmo: this shuld be template generated from mopensuse::config::nfs_server::exports
  file { '/etc/exports':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///configuration/nfs/exports',
    notify  => Class['mopensuse::services::nfs_server'],
    require => Class['mopensuse::packages::nfs_server'],
  }
}
