define mopensuse::user::config::dialout-group (
  $user
) {

  #add user to dialout group
  User <| title == $user |> { groups +> 'dialout' }
}
