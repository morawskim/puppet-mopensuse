# Class: mopensuse
#
# This module manages mopensuse
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class mopensuse {
  
  include mopensuse::account
  include mopensuse::firewall
  include mopensuse::packages::apache2
  include mopensuse::packages::augeas
  include mopensuse::packages::mphp
  include mopensuse::packages::php
  include mopensuse::packages::php53v
  include mopensuse::packages::php54v
  include mopensuse::packages::php56v
  include mopensuse::packages::php7v
  include mopensuse::packages::php-dev-scripts
  include mopensuse::packages::phpmyadmin
  
}
