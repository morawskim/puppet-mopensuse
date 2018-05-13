class mopensuse::packages::gui::xorg_intel (
  $ensure = 'present'
) {

  file { '/etc/X11/xorg.conf.d/20-intel.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/intel/intel-xorg.conf",
    require => Package['apache2']
  }
}
