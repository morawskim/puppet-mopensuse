define mopensuse::user::config::vagrant-group (
  $user
) {

  #add user to vagrant group
  User <| title == $user |> { groups +> 'vagrant' }
}
