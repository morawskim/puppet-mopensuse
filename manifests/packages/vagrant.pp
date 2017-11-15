class mopensuse::packages::vagrant(
  $ensure = 'present',
  $vagrant_nfsd_users,
) {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::bash

  package {'vagrant':
    ensure  => $ensure,
    require => Class['mopensuse::zypper::repositories::morawskim']
  }

  if $::vagrant_version {
    file {"/etc/bash_completion.d/vagrant-${::vagrant_version}.sh":
        ensure  => link,
        target  => "/opt/vagrant/embedded/gems/gems/vagrant-${::vagrant_version}/contrib/bash/completion.sh",
        require => [ Package['vagrant'], Class['mopensuse::packages::bash'] ]
    }
  }

  group { 'vagrant':
    ensure => 'present',
  }

  file { '/etc/sudoers.d/vagrant':
    ensure  => present,
    mode    => '0740',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/vagrant/sudoers.erb"),
    require => Package['vagrant']
  }
}
