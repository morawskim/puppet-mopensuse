class mopensuse::user::gem::pry() {

  package{'pry':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
  }

  package{'pry-doc':
    ensure          => 'installed',
    provider        => 'gem',
    install_options => ['--user', '--user-install'],
    require         => Package['pry']
  }
}
