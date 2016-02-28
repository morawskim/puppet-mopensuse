define mopensuse::user::config::redshift (
    $kde_autostar_dir
) {
  
  include mopensuse::packages::gui::redshift
  
  file {"${kde_autostar_dir}/redshift.sh":
    ensure  => present,
    mode    => '0740',
    owner   => $user,
    group   => $user,
    source  => "puppet:///modules/${module_name}/redshift/autostart.sh",
    require => Class['mopensuse::packages::gui::redshift']
  }
}
