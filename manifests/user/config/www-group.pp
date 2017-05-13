define mopensuse::user::config::www-group (
    $user
) {
  include mopensuse::packages::apache2

  #add user to www group
  User <| title == "${user}" |> { groups +> "www", require +> Class['mopensuse::packages::apache2'] }
}
