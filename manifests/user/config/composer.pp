define mopensuse::user::config::composer (
    $user,
    $github_oauth_token,
    $composer_home
) {
  
  include mopensuse::packages::composer
  
  exec {"composer_github_token for ${user}":
    command     => "composer config github-oauth.github.com '$github_oauth_token'",
    user        => $user,
    environment => ["COMPOSER_HOME=${composer_home}"],
    unless      => "composer config -g github-oauth.github.com | grep ${github_oauth_token}",
    path        => ['/bin', '/usr/bin', '/usr/local/bin/'],
    require     => [ Class['mopensuse::packages::composer'], Class['::composer'], Mopensuse::User::Account[$user] ]
  }
  
}


