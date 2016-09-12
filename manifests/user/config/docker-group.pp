define mopensuse::user::config::docker-group (
    $user
) {
  include mopensuse::packages::docker

  #add user to docker group
  User <| title == "${user}" |> { groups +> "docker", require +> Class['mopensuse::packages::docker'] }
}
