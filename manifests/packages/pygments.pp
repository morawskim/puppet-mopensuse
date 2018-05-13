class mopensuse::packages::pygments (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'python-Pygments':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python']
  }
}
