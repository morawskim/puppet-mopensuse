class mopensuse::samba::users::guest(
  $password
) {
  
  include mopensuse::user::nobody
  
  samba::server::user{ 'nobody':
    password => $password
  }
  
}
