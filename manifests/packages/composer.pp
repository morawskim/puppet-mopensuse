class mopensuse::packages::composer(
  $github_token = undef
) {
  
  include mopensuse::packages::php
  include mopensuse::packages::vcs
  include mopensuse::packages::wget
  
  class { '::composer':
    target_dir      => '/usr/bin',
    composer_file   => 'composer', # could also be 'composer.phar'
    download_method => 'wget',     # or 'curl'
    logoutput       => false,
    tmp_path        => '/tmp',
    php_package     => 'php5',
    curl_package    => 'curl',
    wget_package    => 'wget',
    composer_home   => '/usr/local/share/composer',
    php_bin         => 'php', # could also i.e. be 'php -d "apc.enable_cli=0"' for more fine grained control
    suhosin_enabled => false,
    auto_update     => false, # Set to true to automatically update composer to the latest version
    github_token    => $github_token,
    user            => 'root',
    require         => [ 
      Class['mopensuse::packages::php'],
      Class['mopensuse::packages::vcs'],
      Class['mopensuse::packages::wget']
    ]
  }
  
  include mopensuse::packages::composer-symfony-packages
  include mopensuse::packages::composer-packages
}