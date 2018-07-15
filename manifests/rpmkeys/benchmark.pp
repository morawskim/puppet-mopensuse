class mopensuse::rpmkeys::benchmark {

  ensure_resource(
    'rpmkey',
    'benchmark',
    lookup('mopensuse::rpmkeys')['benchmark']
  )
}
