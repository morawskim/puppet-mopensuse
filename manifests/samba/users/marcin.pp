class mopensuse::samba::users::marcin (
  $password
) {

  samba::server::user { 'marcin':
    password => $password
  }
}
