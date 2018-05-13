class mopensuse::samba::shares::public {

  samba::server::share { 'public':
    comment        => 'Publiczny',
    path           => '/srv/samba/public',
    browsable      => true,
    valid_users    => '@users nobody',
    public         => true,
    writable       => true,
    force_group    => 'users',
    create_mask    => '0777',
    directory_mask => '0777',
    require        => Class['mopensuse::packages::samba']
  }
}
