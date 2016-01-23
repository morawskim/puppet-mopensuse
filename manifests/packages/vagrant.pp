class mopensuse::packages::vagrant {
  
  include mopensuse::zypper::repositories::morawskim
  
  #todo mmo create vagrant facts!
  #rpm -qi vagrant | grep Version | cut -d: -f2 | tr -d ' '
  #vagrant -v | cut -d' ' -f2
  $vagrant_version = '1.7.4'
  
  package {'vagrant':
    ensure  => present,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }
  
  file {'/etc/bash_completion.d/vagrant.sh':
    ensure  => link,
    target  => "/opt/vagrant/embedded/gems/gems/vagrant-${vagrant_version}/contrib/bash/completion.sh",
    require => [ Package['vagrant'], Class['mopensuse::packages::bash'] ]
  }
}