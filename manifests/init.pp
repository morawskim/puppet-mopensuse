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
  
  include mopensuse::packages::apache2
  include mopensuse::packages::apachetop
  include mopensuse::packages::aspell
  include mopensuse::packages::augeas
  include mopensuse::packages::autoconf213
  include mopensuse::packages::bash
  include mopensuse::packages::biabam
  include mopensuse::packages::bind
  include mopensuse::packages::bup
  include mopensuse::packages::ca-certificates
  include mopensuse::packages::cgit
  include mopensuse::packages::colordiff
  include mopensuse::packages::composer
  include mopensuse::packages::ctags
  include mopensuse::packages::cups
  include mopensuse::packages::daps
  include mopensuse::packages::dbus
  include mopensuse::packages::devel-c-cpp
  include mopensuse::packages::devel-java
  include mopensuse::packages::devel-qt5
  include mopensuse::packages::devel-ruby
  include mopensuse::packages::dhcpd
  include mopensuse::packages::filesystem
  include mopensuse::packages::firewall
  include mopensuse::packages::ftp
  include mopensuse::packages::gettext
  include mopensuse::packages::git-server
  include mopensuse::packages::graphviz
  include mopensuse::packages::httrack
  include mopensuse::packages::inotify-tools
  include mopensuse::packages::jenkins
  include mopensuse::packages::libguestfs
  include mopensuse::packages::libxml2-tools
  include mopensuse::packages::logwatch
  include mopensuse::packages::lshw
  include mopensuse::packages::lynx
  include mopensuse::packages::mailhog
  include mopensuse::packages::maven
  include mopensuse::packages::monitoring
  include mopensuse::packages::mphp
  include mopensuse::packages::mutt
  include mopensuse::packages::mysql
  include mopensuse::packages::mytop
  include mopensuse::packages::nethogs
  include mopensuse::packages::network
  include mopensuse::packages::nfs
  include mopensuse::packages::nfs-server
  include mopensuse::packages::ngrep
  include mopensuse::packages::ngrok
  include mopensuse::packages::nodejs
  include mopensuse::packages::notify-send
  include mopensuse::packages::offlineimap
  include mopensuse::packages::openssl
  include mopensuse::packages::openvpn
  include mopensuse::packages::php
  include mopensuse::packages::php53v
  include mopensuse::packages::php54v
  include mopensuse::packages::php56v
  include mopensuse::packages::php7v
  include mopensuse::packages::php-dev-scripts
  include mopensuse::packages::phpmyadmin
  include mopensuse::packages::postfix
  include mopensuse::packages::procps
  include mopensuse::packages::pwgen
  include mopensuse::packages::redis
  include mopensuse::packages::rpmbuild
  include mopensuse::packages::samba
  include mopensuse::packages::samba-client
  include mopensuse::packages::sensors
  include mopensuse::packages::skype
  include mopensuse::packages::soapui
  include mopensuse::packages::sqlite3-devel
  include mopensuse::packages::sshd
  include mopensuse::packages::sshfs
  include mopensuse::packages::strace
  include mopensuse::packages::susepaste
  include mopensuse::packages::swaks
  include mopensuse::packages::tcpdump
  include mopensuse::packages::testdisk
  include mopensuse::packages::tmux
  include mopensuse::packages::tomcat
  include mopensuse::packages::tree
  include mopensuse::packages::vagrant
  include mopensuse::packages::vcs
  include mopensuse::packages::vim
  include mopensuse::packages::virtualbox
  include mopensuse::packages::wget
  include mopensuse::packages::wireshark
  include mopensuse::packages::wpcli
  include mopensuse::packages::x11vnc
  include mopensuse::packages::zabbix
  include mopensuse::packages::zabbix-agent
  
  include mopensuse::packages::gui::calibre
  include mopensuse::packages::gui::chrome
  include mopensuse::packages::gui::clion
  include mopensuse::packages::gui::filezilla
  include mopensuse::packages::gui::glxgears
  include mopensuse::packages::gui::hardinfo
  include mopensuse::packages::gui::jetbrains-download-scripts
  include mopensuse::packages::gui::kapptemplate
  include mopensuse::packages::gui::kcachegrind
  include mopensuse::packages::gui::kdeconnect
  include mopensuse::packages::gui::kdiff3
  include mopensuse::packages::gui::krdc
  include mopensuse::packages::gui::krusader
  include mopensuse::packages::gui::kup
  include mopensuse::packages::gui::libqt4-x11
  include mopensuse::packages::gui::lshw-gui
  include mopensuse::packages::gui::mysql-workbench
  include mopensuse::packages::gui::owncloud-client
  include mopensuse::packages::gui::pgadmin
  include mopensuse::packages::gui::phpstorm
  include mopensuse::packages::gui::pidgin
  include mopensuse::packages::gui::plasma-nm-openvpn
  include mopensuse::packages::gui::redshift
  include mopensuse::packages::gui::rubymine
  include mopensuse::packages::gui::scrot
  include mopensuse::packages::gui::skrooge
  include mopensuse::packages::gui::steam
  include mopensuse::packages::gui::susepaste-screenshot
  include mopensuse::packages::gui::vcs
  include mopensuse::packages::gui::virtualbox-qt
  include mopensuse::packages::gui::vivaldi
  include mopensuse::packages::gui::wireshark-qt
  include mopensuse::packages::gui::xclip
  include mopensuse::packages::gui::xorg-intel
  include mopensuse::packages::gui::yakuake
  include mopensuse::packages::gui::zenity
  
  include mopensuse::user::marcin
  include mopensuse::printers::samsung
  
  include mopensuse::samba::shares::public
  include mopensuse::samba::users::guest
  include mopensuse::samba::users::marcin
}
