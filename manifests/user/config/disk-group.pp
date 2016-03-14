define mopensuse::user::config::disk-group (
    $user
) {
  
  notify {"add user '${user}' to disk group":
    subscribe => User[$user]
  }
  
  #add user to disk group
  User <| title == "${user}" |> { groups +> "disk" }
  
}
