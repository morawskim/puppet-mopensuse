class mopensuse::rpmkeys::kde_kup {

  ensure_resource(
    'rpmkey',
    'kde_kup',
    hiera_hash('mopensuse::rpmkeys::kde_kup')
  )
}
