class mopensuse::packages::foreman($ensure = 'present') {

  include mopensuse::zypper::repositories::devel_languages_ruby_extensions

  package {"ruby${::rubydefverion['majversion']}-rubygem-foreman":
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions']
  }
}
