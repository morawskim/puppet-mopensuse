class mopensuse::packages::devel-c-cpp {
  
  package {['boost-devel', 'boost-jam', 'glibc-info', 'ltrace', 'posix_cc',
      'swig', 'valgrind', 'patterns-openSUSE-devel_C_C++',
      'patterns-openSUSE-devel_basis']:
    ensure => present
  }
  
}