class mopensuse::packages::gui::owasp_zap {

  include mopensuse::zypper::repositories::security_tools

  package {'owasp-zap':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::security_tools']
  }
}