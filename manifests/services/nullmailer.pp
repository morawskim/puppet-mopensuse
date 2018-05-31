class mopensuse::services::nullmailer {
  include mopensuse::packages::nullmailer

  service { 'nullmailer':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['mopensuse::packages::nullmailer'],
  }
}
