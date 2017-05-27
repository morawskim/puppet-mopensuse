class mopensuse::packages::nodejs {

  include mopensuse::packages::nodejs_packages

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'nodejs4'
  } else {
    $packagename = 'nodejs'
  }

  package {$packagename:
    ensure => present
  }

  package {"${packagename}-devel":
    ensure  => present,
    require => Package[$packagename]
  }
}
