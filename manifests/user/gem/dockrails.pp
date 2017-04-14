class mopensuse::user::gem::dockrails() {

  package{'dockrails':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
  }
}
