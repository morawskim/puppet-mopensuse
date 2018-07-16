class mopensuse::packages::nodejs (
  $ensure = 'present'
) {
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
