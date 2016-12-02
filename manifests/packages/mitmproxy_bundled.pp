class mopensuse::packages::mitmproxy_bundled {

  include mopensuse::zypper::repositories::morawskim

  package {'python-mitmproxy-bundled':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}