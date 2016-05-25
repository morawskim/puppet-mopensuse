define mopensuse::user::config::sshfs-group (
    $user
) {
  
  #add user to vagrant group
  User <| title == "${user}" |> { groups +> "sshfs" }
  
}
