class mopensuse::packages::devel_c_cpp($ensure = 'present') {

  include mopensuse::zypper::repositories::debug
  include mopensuse::zypper::repositories::debug_update

  package {['glibc-info', 'ltrace', 'posix_cc',
      'swig', 'valgrind', 'patterns-openSUSE-devel_C_C++',
      'patterns-openSUSE-devel_basis', 're2c']:
    ensure => $ensure,
  }
}
