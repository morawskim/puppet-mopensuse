class mopensuse::packages::vagrant(
  $vagrant_nfsd_users,
  $vagrant_home = '/usr/share/vagrant'
) {

  include mopensuse::zypper::repositories::morawskim
  include mopensuse::packages::bash
  include mopensuse::packages::augeas

  package {'vagrant':
    ensure  => present,
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

  file { $vagrant_home:
    ensure   => directory,
    mode     => '2775',
    owner    => 'root',
    group    => 'vagrant',
    require  => Group['vagrant']
  }

  augeas { "/files/etc/environment/VAGRANT_HOME":
    changes => [
      "set /files/etc/environment/VAGRANT_HOME '$vagrant_home'",
    ],
    require => [ Class["mopensuse::packages::augeas"], File[$vagrant_home] ]
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
