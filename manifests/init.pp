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
  
  include mopensuse::packages::apache2
  include mopensuse::packages::augeas
  include mopensuse::packages::bash
  include mopensuse::packages::colordiff
  include mopensuse::packages::firewall
  include mopensuse::packages::ftp
  include mopensuse::packages::gettext
  include mopensuse::packages::lynx
  include mopensuse::packages::monitoring
  include mopensuse::packages::mphp
  include mopensuse::packages::network
  include mopensuse::packages::nfs
  include mopensuse::packages::nodejs
  include mopensuse::packages::notify-send
  include mopensuse::packages::openssl
  include mopensuse::packages::openvpn
  include mopensuse::packages::php
  include mopensuse::packages::php53v
  include mopensuse::packages::php54v
  include mopensuse::packages::php56v
  include mopensuse::packages::php7v
  include mopensuse::packages::php-dev-scripts
  include mopensuse::packages::phpmyadmin
  include mopensuse::packages::redis
  include mopensuse::packages::rpmbuild
  include mopensuse::packages::samba-client
  include mopensuse::packages::vagrant
  include mopensuse::packages::vcs
  include mopensuse::packages::virtualbox
  
  include mopensuse::packages::gui::hardinfo
  include mopensuse::packages::gui::skrooge
  
}
