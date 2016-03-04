define mopensuse::user::config::users-group (
    $user
) {
  
  notify {"add user '${user}' to users group":
    subscribe => User[$user]
  }
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "users" }
  
}
