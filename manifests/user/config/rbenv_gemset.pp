define mopensuse::user::config::rbenv_gemset (
  $user,
  $user_home_path
) {

  $rbenv_plugins_dir="$user_home_path/.rbenv/plugins"

  if !defined($rbenv_plugins_dir) {
    file {$rbenv_plugins_dir:
      ensure => directory,
      mode   => '0750',
      owner  => $user,
      group  => $user
    }
  }

  vcsrepo { "${rbenv_plugins_dir}/rbenv-gemset":
    ensure     => present,
    provider   => git,
    source     => 'git://github.com/jamis/rbenv-gemset.git',
    user       => $user,
    owner      => $user,
    group      => $user,
    submodules => true,
  }
}
