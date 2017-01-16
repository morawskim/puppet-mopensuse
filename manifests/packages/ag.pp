class mopensuse::packages::ag {

  include mopensuse::zypper::repositories::utilities

  package {'the_silver_searcher':
    ensure          => present,
    install_options => [ {'--from' => 'utilities'} ],
    require         => Class['mopensuse::zypper::repositories::utilities']
  }
}