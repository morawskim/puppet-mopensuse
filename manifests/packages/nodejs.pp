class mopensuse::packages::nodejs (
  $ensure = 'present'
) {
  include mopensuse::packages::nodejs_packages

  if $::operatingsystemrelease > 13.2 {
    $packagename = 'nodejs4'
  } else {
    $packagename = 'nodejs'
  }

  package { $packagename:
    ensure => $ensure,
  }

  package { "${packagename}-devel":
    ensure  => $ensure,
    require => Package[$packagename]
  }
}
