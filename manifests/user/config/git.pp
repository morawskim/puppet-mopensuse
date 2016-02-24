define mopensuse::user::config::git (
  $user,
  $user_home_path,
  $git_user_name,
  $git_user_email,
  $git_diff_tool
) {

  gitconfig { "${user}-user.name":
    home    => $user_home_path,
    key     => 'user.name',
    value   => $git_user_name,
    user    => $user,
    require => Mopensuse::User::Account[$user]
  }
  
  gitconfig { "${user}-user.email":
    home    => $user_home_path,
    key     => 'user.email',
    value   => $git_user_email,
    user    => $user,
    require => Mopensuse::User::Account[$user]
  }
  
  gitconfig { "${user}-diff.tool":
    home    => $user_home_path,
    key     => 'diff.tool',
    value   => $git_diff_tool,
    user    => $user,
    require => Mopensuse::User::Account[$user]
  }
  
}