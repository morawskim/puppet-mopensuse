class mopensuse::packages::mitmproxy_bundled($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'python-mitmproxy-bundled':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}