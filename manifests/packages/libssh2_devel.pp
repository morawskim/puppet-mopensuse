class mopensuse::packages::libssh2_devel {

  include mopensuse::zypper::repositories::devel_languages_c_cpp

  case $::operatingsystemrelease {
    '42.2':           { $version = '1.7.0' }
    '13.2':           { $version = '1.6.0' }
    default:          { $version = 'latest' }
  }

  package {['libssh2-devel']:
    ensure  => $version,
    install_options => [ {'--from' => 'devel_libraries_c_cpp'}, '--force' ],
  }

  package {['libssh2-1']:
    ensure  => $version,
    install_options => [ {'--from' => 'devel_libraries_c_cpp'}, '--force' ],
    require => Class['mopensuse::zypper::repositories::devel_languages_c_cpp'],
    before  => Package['libssh2-devel'],
  }
}