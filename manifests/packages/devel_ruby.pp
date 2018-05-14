class mopensuse::packages::devel_ruby (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_ruby_extensions
  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::valgrind_devel
  include mopensuse::packages::bundler
  include mopensuse::packages::ruby_build

  package { ['patterns-openSUSE-devel_ruby', 'ruby', "ruby${::rubydefverion['majversion']}-devel",
    "ruby${::rubydefverion['majversion']}-devel-extra", 'ruby-devel', 'completion-ruby', 'rbenv'
  ]:
    ensure  => $ensure,
    require => [
      Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions'],
      Class['mopensuse::zypper::repositories::morawskim']
    ]
  }
}
