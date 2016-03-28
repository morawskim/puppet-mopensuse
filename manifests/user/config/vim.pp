define mopensuse::user::config::vim (
  $user,
  $user_home_path
) {
  
  include mopensuse::packages::vim
    
  vcsrepo { "${user_home_path}/.vim":
    ensure     => present,
    provider   => git,
    source     => 'git@github.com:morawskim/vimdot.git',
    user       => $user,
    owner      => $user,
    group      => $user,
    submodules => true,
    require    => Mopensuse::User::Account[$user]
  }
  
  file {"${user_home_path}/.vimrc":
    ensure  => link,
    target  => "${user_home_path}/.vim/vimrc",
    require => Vcsrepo["${user_home_path}/.vim"]
  }
  
  file {"${user_home_path}/.gvimrc":
    ensure  => link,
    target  => "${user_home_path}/.vim/vimrc",
    require => Vcsrepo["${user_home_path}/.vim"]
  }
}
