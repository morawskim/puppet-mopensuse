define mopensuse::user::config::tomcat-group (
  $user
) {
  include mopensuse::packages::tomcat


  #add user to tomcat group
  User <| title == $user |> { groups +> 'tomcat', require +> Class['mopensuse::packages::tomcat'] }
}
