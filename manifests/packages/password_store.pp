class mopensuse::packages::password_store($ensure = 'present') {

  include mopensuse::zypper::repositories::security_privacy

  package {'password-store':
    ensure          => $ensure,
    install_options => [ {'--from' => 'security_privacy'} ],
    require         => Class['mopensuse::zypper::repositories::security_privacy']
  }
}
