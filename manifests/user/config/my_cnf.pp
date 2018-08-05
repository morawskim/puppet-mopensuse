define mopensuse::user::config::my_cnf (
  $settings,
  $my_cnf_path
) {

  validate_hash($settings)
  # todo mmo - debug why I cant set path in hieradata
  $defaults = {path => $my_cnf_path}
  create_ini_settings($settings, $defaults)
}
