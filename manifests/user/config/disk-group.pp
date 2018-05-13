define mopensuse::user::config::disk-group (
  $user
) {

  #add user to disk group
  User <| title == $user |> { groups +> 'disk' }
}
