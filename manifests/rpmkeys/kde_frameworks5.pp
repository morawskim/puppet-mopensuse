class mopensuse::rpmkeys::kde_frameworks5 {

  ensure_resource(
    'rpmkey',
    'kde_frameworks5',
    hiera_hash('mopensuse::rpmkeys::kde_frameworks5')
  )
}
