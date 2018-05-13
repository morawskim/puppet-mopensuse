class mopensuse::user::gem::showterm () {

  package { 'showterm':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
  }
}
