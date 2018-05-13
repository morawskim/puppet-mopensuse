class mopensuse::packages::gui::sqlitebrowser (
  $ensure = 'present'
) {

  package { 'sqlitebrowser':
    ensure => $ensure,
  }
}
