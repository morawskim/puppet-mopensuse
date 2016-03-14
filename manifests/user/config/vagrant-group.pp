define mopensuse::user::config::vagrant-group (
    $user
) {
  
  notify {"add user '${user}' to vagrant group":
    subscribe => User[$user]
  }
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "vagrant" }
  
}
