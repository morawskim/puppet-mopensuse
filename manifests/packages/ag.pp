class mopensuse::packages::ag($ensure = 'present') {

  include mopensuse::zypper::repositories::utilities

  package {'the_silver_searcher':
    ensure          => $ensure,
    install_options => [ {'--from' => 'utilities'} ],
    require         => Class['mopensuse::zypper::repositories::utilities']
  }
}