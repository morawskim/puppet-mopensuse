class mopensuse::rpmkeys::kde_extra {

  ensure_resource(
    'rpmkey',
    'kde_extra',
    hiera_hash('mopensuse::rpmkeys::kde_extra')
  )
}
