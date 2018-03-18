define mopensuse::user::config::osc_group (
    $user
) {

  include mopensuse::packages::osc

  #add user to osc group
  User <| title == "${user}" |> {
    groups +> "osc",
    require +> Class['mopensuse::packages::osc']
  }
}
