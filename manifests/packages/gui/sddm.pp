class mopensuse::packages::gui::sddm (
  $ensure = 'present'
) {

  package { 'sddm':
    ensure => $ensure,
  }

  unless member(['absent', 'purged'], $ensure) {
    ini_setting { 'sddm enable numlock':
      ensure            => present,
      path              => '/etc/sddm.conf',
      section           => 'General',
      setting           => 'Numlock',
      value             => 'on',
      key_val_separator => '=',
      require           => Package['sddm']
    }
  }
}
