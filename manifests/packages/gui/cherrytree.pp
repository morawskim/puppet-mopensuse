class mopensuse::packages::gui::cherrytree (
  $ensure = 'present'
) {

  package { 'cherrytree':
    ensure => $ensure,
  }
}
