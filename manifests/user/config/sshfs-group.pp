define mopensuse::user::config::sshfs-group (
    $user
) {
  
  notify {"add user '${user}' to sshfs group":
    subscribe => User[$user]
  }
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "sshfs" }
  
}
