class mopensuse::packages::python_gnuplot_py (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::devel_languages_python

  package { 'python-gnuplot-py':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::devel_languages_python'],
  }
}
