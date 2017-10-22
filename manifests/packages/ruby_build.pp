class mopensuse::packages::ruby_build($ensure = 'present') {

  include mopensuse::zypper::repositories::devel_languages_ruby_extensions
  include mopensuse::zypper::repositories::morawskim

  package {'ruby-build':
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions'],
      Class['mopensuse::zypper::repositories::morawskim']
    ]
  }
}
