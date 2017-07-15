class mopensuse::packages::scapy($ensure = 'present') {

  include mopensuse::zypper::repositories::security
  include mopensuse::packages::python_gnuplot_py
  include mopensuse::packages::python_pyx

  package {'scapy':
    ensure          => $ensure,
    require         => Class['mopensuse::zypper::repositories::security']
  }
}
