class mopensuse::packages::html2text (
  $ensure = 'present'
) {

  package { 'html2text':
    ensure => $ensure,
  }
}
