class mopensuse::rpmkeys::benchmark {

  ensure_resource(
    'rpmkey',
    'benchmark',
    hiera_hash('mopensuse::rpmkeys::benchmark')
  )
}
