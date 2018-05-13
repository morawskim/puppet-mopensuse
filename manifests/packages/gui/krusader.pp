class mopensuse::packages::gui::krusader (
  $ensure = 'present'
) {

  package { 'krusader':
    ensure => $ensure,
  }
}
