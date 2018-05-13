class mopensuse::packages::py2pack (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'python-py2pack':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python']
  }
}
