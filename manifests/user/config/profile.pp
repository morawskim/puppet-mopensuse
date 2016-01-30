define mopensuse::user::config::profile (
  $user,
  $user_home_path
) {
  
  notify {"create profile dir for ${user}": }
  
  $profile_dir   = "${user_home_path}/.profile.d"
  $profile_file  = "${user_home_path}/.bashrc"
  
  file_line {"${user_home_path}/.bashrc load_scripts":
    path    => $profile_file,
    line    => "test -d ${profile_dir} && for scriptname in ${profile_dir}/*.bash; do test -r \$scriptname && source \$scriptname && unset scriptname; done",
    require => [ File[$profile_dir], File[$profile_file] ]
  }
  
  file {$profile_file:
    path   => $profile_file,
    ensure => present
  }
  
  file {$profile_dir:
    ensure  => directory,
  #  source  => "puppet:///modules/dot/.profile.d",
  #  recurse => 'remote', #we dont want delete unmanaged files from a directory
    owner   => $user,
    group   => $user,
    mode    => "0750",
    backup  => false,
    require => Mopensuse::User::Account[$user]
  }
  
}
