class mopensuse::packages::bundler {

    include mopensuse::zypper::repositories::ruby_extensions

    package {'ruby2.1-rubygem-bundler':
    ensure  => present,
    require => [
        Class['mopensuse::zypper::repositories::ruby_extensions']
    ]
  }
}
