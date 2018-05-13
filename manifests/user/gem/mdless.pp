class mopensuse::user::gem::mdless () {

  package { 'mdless':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
  }
}
