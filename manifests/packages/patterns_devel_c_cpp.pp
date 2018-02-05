class mopensuse::packages::patterns_devel_c_cpp($ensure = 'present') {

  package{['patterns-devel-C-C++-devel_C_C++']:
      ensure   => $ensure,
  }
}
