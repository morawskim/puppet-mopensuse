define mopensuse::user::config::vboxusers-group (
    $user
) {
  
  include mopensuse::packages::virtualbox

  #add user to group vboxusers
  User <| title == "${user}" |> { groups +> "vboxusers" }
  
}
