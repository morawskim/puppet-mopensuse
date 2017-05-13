define mopensuse::user::config::systemd_journal_group (
    $user
) {
  include mopensuse::packages::systemd

  #add user to systemd-journal group
  User <| title == "${user}" |> { groups +> "systemd-journal", require +> Class['mopensuse::packages::systemd'] }
}
