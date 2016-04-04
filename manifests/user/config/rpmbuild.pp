define mopensuse::user::config::rpmbuild (
    $user,
    $user_home_path
) {

    vcsrepo { "$user_home_path/rpmbuild":
        ensure     => present,
        provider   => git,
        source     => 'git@github.com:morawskim/rpmbuild.git',
        user       => $user,
        owner      => $user,
        group      => $user,
        submodules => true,
        require    => Mopensuse::User::Account[$user]
    }
}
