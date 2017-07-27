define mopensuse::user::config::groups (
    $user,
    $groups
) {
  validate_array($groups)
  User <| title == "${user}" |> { groups +> $groups }
}
