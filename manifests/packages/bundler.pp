class mopensuse::packages::bundler (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_ruby_extensions

  package { "ruby${::rubydefverion['majversion']}-rubygem-bundler":
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions']
    ]
  }
}
