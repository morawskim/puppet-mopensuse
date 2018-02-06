class mopensuse::packages::rubygem_ronn(
  $package_name,
  $ensure = 'present'
) {

  include mopensuse::zypper::repositories::devel_languages_ruby_extensions

  package {$package_name:
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_ruby_extensions']
  }
}

