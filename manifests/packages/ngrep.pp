class mopensuse::packages::ngrep (
  $ensure = 'present'
) {

  package { 'ngrep':
    ensure => $ensure,
  }
}
