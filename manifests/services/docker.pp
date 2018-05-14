class mopensuse::services::docker {
  include mopensuse::packages::docker

  service { 'docker':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::docker'],
  }
}
