class mopensuse::packages::devel-c-cpp {
  
  include mopensuse::zypper::repositories::debug
  include mopensuse::zypper::repositories::debug_update

  package {['boost-devel', 'boost-jam', 'glibc-info', 'ltrace', 'posix_cc',
      'swig', 'valgrind', 'patterns-openSUSE-devel_C_C++',
      'patterns-openSUSE-devel_basis']:
    ensure => present
  }
  
}