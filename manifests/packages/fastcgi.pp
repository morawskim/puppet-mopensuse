class mopensuse::packages::fastcgi (
  $ensure = 'present'
) {

  package { 'FastCGI':
    ensure => $ensure,
  }
}
