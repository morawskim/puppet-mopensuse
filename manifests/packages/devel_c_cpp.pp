class mopensuse::packages::devel_c_cpp($ensure = 'present') {

  include mopensuse::zypper::repositories::repo_debug
  include mopensuse::zypper::repositories::repo_debug_update
  include mopensuse::packages::patterns_devel_c_cpp

  package {['glibc-info', 'ltrace', 'posix_cc',
      'swig', 'valgrind', 're2c']:
    ensure => $ensure,
  }
}
