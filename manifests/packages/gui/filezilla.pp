class mopensuse::packages::gui::filezilla (
  $ensure = 'present'
) {

  package { 'filezilla':
    ensure => $ensure,
  }
}
