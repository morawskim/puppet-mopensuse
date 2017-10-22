class mopensuse::packages::bundler($ensure = 'present') {

    include mopensuse::zypper::repositories::devel_languages_ruby_extensions

    package {'ruby2.1-rubygem-bundler':
    ensure  => $ensure,
    require => [
        Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions']
    ]
  }
}
