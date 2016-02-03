class mopensuse::packages::soapui {
  
  #include archive::prerequisites
  
  $soapui_version = '5.2.1'
  $dest_dir       = '/opt/soapui'
  
  file { $dest_dir:
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root'
  }

  archive { "soapui-${soapui_version}":
    ensure   => present,
    url      => "http://cdn01.downloads.smartbear.com/soapui/${soapui_version}/SoapUI-${soapui_version}-linux-bin.tar.gz",
    target   => $dest_dir,
    checksum => false,
    require  => File[$dest_dir]
  }
  
  file { "/opt/soapui/SoapUI-${soapui_version}/soapUI-logo.png":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/${module_name}/soapui/soapUI-logo.png",
    require => Archive["soapui-${soapui_version}"]
  }
  
  file { '/usr/share/applications/SoapUI.desktop':
    ensure   => present,
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
    content  => template("${module_name}/soapui/soapui.desktop.erb"),
    require  => File["/opt/soapui/SoapUI-${soapui_version}/soapUI-logo.png"]
  }
  
}