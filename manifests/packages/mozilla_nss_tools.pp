class mopensuse::packages::mozilla_nss_tools (
  $ensure = 'present'
) {

  package { 'mozilla-nss-tools':
    ensure => $ensure,
  }
}
