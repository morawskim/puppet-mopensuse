define mopensuse::user::config::symlink (
  $path,
  $target,

  $owner,
  $group,
  $mode = '0600',
) {
  file { $path:
    ensure => 'link',
    group  => '0',
    owner  => '0',
    target => $target,
  }

  file { $target:
    ensure => 'file',
    owner  => $owner,
    group  => $group,
    mode   => $mode
  }
}
