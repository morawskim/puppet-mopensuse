class mopensuse::packages::gui::owasp_zap (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::security_tools

  package { 'owasp-zap':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::security_tools']
  }
}
