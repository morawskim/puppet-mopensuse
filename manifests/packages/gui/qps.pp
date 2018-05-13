class mopensuse::packages::gui::qps (
  $ensure = 'present'
) {

  package { 'qps':
    ensure => $ensure,
  }
}
