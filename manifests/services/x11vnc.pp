class mopensuse::services::x11vnc {

  ensure_resource(
    'service',
    'x11vnc',
    lookup('mopensuse::services')['x11vnc']
  )
}
