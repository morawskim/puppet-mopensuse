class mopensuse::packages::cloudflare_tools($ensure = 'present') {

  include mopensuse::zypper::repositories::morawskim

  package {'cloudflare-tools':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
