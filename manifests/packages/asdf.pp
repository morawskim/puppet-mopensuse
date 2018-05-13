class mopensuse::packages::asdf {
  include mopensuse::zypper::repositories::morawskim

  package { ['asdf', 'asdf-plugin-php']:
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
}
