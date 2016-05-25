define mopensuse::user::config::profile (
  $user,
  $user_home_path
) {
  
  $profile_dir   = "${user_home_path}/.profile.d"
  $profile_file  = "${user_home_path}/.bashrc"
  
  file_line {"${user_home_path}/.bashrc load_scripts":
    path    => $profile_file,
    line    => "test -d ${profile_dir} && for scriptname in ${profile_dir}/*.bash; do test -r \$scriptname && source \$scriptname && unset scriptname; done",
    require => [ Vcsrepo[$profile_dir], File[$profile_file] ]
  }
  
  file {$profile_file:
    path   => $profile_file,
    ensure => present
  }
  
  vcsrepo { "$profile_dir":
    ensure     => present,
    provider   => git,
    source     => 'git@github.com:morawskim/bash-profile.d.git',
    user       => $user,
    owner      => $user,
    group      => $user,
    submodules => true,
    require    => Mopensuse::User::Account[$user]
  }
}
