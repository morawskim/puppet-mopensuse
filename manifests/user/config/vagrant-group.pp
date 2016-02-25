define mopensuse::user::config::vagrant-group (
    $user
) {
  
  notify {"add user '${user}' to vagrant group": }
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "vagrant" }
  
}
