class mopensuse::packages::lame (
  $ensure = 'present'
) {
  include mopensuse::zypper::repositories::packman

  package { ['lame']:
    ensure          => $ensure,
    install_options => [ { '--from' => 'packman' } ],
    require         => [
      Class['mopensuse::zypper::repositories::packman']
    ]
  }
}
