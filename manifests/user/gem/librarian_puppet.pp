class mopensuse::user::gem::librarian_puppet () {

  package { 'librarian-puppet':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
  }
}
