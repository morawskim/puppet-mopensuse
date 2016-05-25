define mopensuse::user::config::users-group (
    $user
) {
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "users" }
  
}
