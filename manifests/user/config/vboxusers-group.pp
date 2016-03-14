define mopensuse::user::config::vboxusers-group (
    $user
) {
  
  include mopensuse::packages::virtualbox
  
  notify {"add user '${user}' to vboxusers":
    subscribe => User[$user]
  }
  
  #add user to group vboxusers
  User <| title == "${user}" |> { groups +> "vboxusers" }
  
}
