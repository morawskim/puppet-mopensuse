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

  include mopensuse::packages::ag
  include mopensuse::packages::alien
  include mopensuse::packages::apache2
  include mopensuse::packages::apachetop
  include mopensuse::packages::asdf
  include mopensuse::packages::aspell
  include mopensuse::packages::augeas
  include mopensuse::packages::autoconf213
  include mopensuse::packages::bash
  include mopensuse::packages::bcal
  include mopensuse::packages::biabam
  include mopensuse::packages::bind_utils
  include mopensuse::packages::bsdtar
  include mopensuse::packages::bup
  include mopensuse::packages::byobu
  include mopensuse::packages::ca_certificates
  include mopensuse::packages::cgit
  include mopensuse::packages::cheat
  include mopensuse::packages::cloudflare_tools
  include mopensuse::packages::colordiff
  include mopensuse::packages::colout
  include mopensuse::packages::composer
  include mopensuse::packages::createrepo
  include mopensuse::packages::csvkit
  include mopensuse::packages::ctags
  include mopensuse::packages::ctop
  include mopensuse::packages::cups
  include mopensuse::packages::daps
  include mopensuse::packages::dateutils
  include mopensuse::packages::dbus
  include mopensuse::packages::debhelper
  include mopensuse::packages::devel_c_cpp
  include mopensuse::packages::devel_java
  include mopensuse::packages::devel_kde
  include mopensuse::packages::devel_qt5
  include mopensuse::packages::devel_ruby
  include mopensuse::packages::dhcpd
  include mopensuse::packages::dnsmasq
  include mopensuse::packages::docker
  include mopensuse::packages::dockerize
  include mopensuse::packages::dpkg
  include mopensuse::packages::dtrx
  include mopensuse::packages::easy_rsa2
  include mopensuse::packages::enhancd
  include mopensuse::packages::exa
  include mopensuse::packages::fakeprovide
  include mopensuse::packages::fastcgi
  include mopensuse::packages::fbcat
  include mopensuse::packages::ffmpeg
  include mopensuse::packages::firewall
  include mopensuse::packages::fontawesome
  include mopensuse::packages::foreman
  include mopensuse::packages::ftp
  include mopensuse::packages::fzf_tmux
  include mopensuse::packages::fzf
  include mopensuse::packages::gearmand
  include mopensuse::packages::gettext
  include mopensuse::packages::gifsicle
  include mopensuse::packages::gifski
  include mopensuse::packages::git_server
  include mopensuse::packages::glances
  include mopensuse::packages::git_crypt
  include mopensuse::packages::git_extras
  include mopensuse::packages::git_hooks
  include mopensuse::packages::graphviz
  include mopensuse::packages::greenmail
  include mopensuse::packages::hstr
  include mopensuse::packages::html2text
  include mopensuse::packages::httperf
  include mopensuse::packages::httpry
  include mopensuse::packages::httrack
  include mopensuse::packages::hub
  include mopensuse::packages::imagemagick
  include mopensuse::packages::inotify_tools
  include mopensuse::packages::iperf
  include mopensuse::packages::isync
  include mopensuse::packages::jq
  include mopensuse::packages::json_tools
  include mopensuse::packages::kiwi
  include mopensuse::packages::lame
  include mopensuse::packages::libguestfs
  include mopensuse::packages::libxml2_tools
  include mopensuse::packages::live_fat_stick
  include mopensuse::packages::linkchecker
  include mopensuse::packages::live_grub_stick
  include mopensuse::packages::lnav
  include mopensuse::packages::logwatch
  include mopensuse::packages::lshw
  include mopensuse::packages::lynx
  include mopensuse::packages::machinery
  include mopensuse::packages::mailhog
  include mopensuse::packages::mailutil
  include mopensuse::packages::maven
  include mopensuse::packages::mc
  include mopensuse::packages::memcached
  include mopensuse::packages::monit
  include mopensuse::packages::monitoring
  include mopensuse::packages::monoid
  include mopensuse::packages::mozilla_nss_tools
  include mopensuse::packages::msmtp
  include mopensuse::packages::mssys
  include mopensuse::packages::multitail
  include mopensuse::packages::mutt
  include mopensuse::packages::mycli
  include mopensuse::packages::mysql_bench
  include mopensuse::packages::mysql
  include mopensuse::packages::mysql_utilities
  include mopensuse::packages::mytop
  include mopensuse::packages::ncdu
  include mopensuse::packages::net_snmp
  include mopensuse::packages::netcat_openbsd
  include mopensuse::packages::nethogs
  include mopensuse::packages::netsed
  include mopensuse::packages::network
  include mopensuse::packages::nfs
  include mopensuse::packages::newsbeuter
  include mopensuse::packages::nfs_server
  include mopensuse::packages::ngrep
  include mopensuse::packages::ngrok
  include mopensuse::packages::nmon
  include mopensuse::packages::nodejs
  include mopensuse::packages::nodejs6
  include mopensuse::packages::notify_send
  include mopensuse::packages::ntfs3g
  include mopensuse::packages::o_saft
  include mopensuse::packages::offlineimap
  include mopensuse::packages::openssl
  include mopensuse::packages::openvpn
  include mopensuse::packages::osc
  include mopensuse::packages::p7zip
  include mopensuse::packages::packer
  include mopensuse::packages::pandoc
  include mopensuse::packages::password_store
  include mopensuse::packages::patchutils
  include mopensuse::packages::pax_utils
  include mopensuse::packages::phing
  include mopensuse::packages::php_build
  include mopensuse::packages::php_docs
  include mopensuse::packages::php
  include mopensuse::packages::php53v
  include mopensuse::packages::php54v
  include mopensuse::packages::php55v
  include mopensuse::packages::php56v
  include mopensuse::packages::php70v
  include mopensuse::packages::php71v
  include mopensuse::packages::phpldapadmin
  include mopensuse::packages::phpmyadmin
  include mopensuse::packages::phpmyadmin40
  include mopensuse::packages::pktstat
  include mopensuse::packages::powerline
  include mopensuse::packages::procps
  include mopensuse::packages::proxychains_ng
  include mopensuse::packages::puppet
  include mopensuse::packages::putty
  include mopensuse::packages::pv
  include mopensuse::packages::pwgen
  include mopensuse::packages::py2pack
  include mopensuse::packages::python3_devel
  include mopensuse::packages::python3_docopt
  include mopensuse::packages::python3_pipsi
  include mopensuse::packages::python_devel
  include mopensuse::packages::python_keyring
  include mopensuse::packages::python_pipsi
  include mopensuse::packages::qemu_arm
  include mopensuse::packages::qemu_kvm
  include mopensuse::packages::qemu_linux_user
  include mopensuse::packages::quilt
  include mopensuse::packages::rar
  include mopensuse::packages::redis
  include mopensuse::packages::rpmbuild
  include mopensuse::packages::rpmorphan
  include mopensuse::packages::samba
  include mopensuse::packages::samba_client
  include mopensuse::packages::scapy
  include mopensuse::packages::selenium
  include mopensuse::packages::sensors
  include mopensuse::packages::smbnetfs
  include mopensuse::packages::smtpcli
  include mopensuse::packages::socat
  include mopensuse::packages::sqlite3_devel
  include mopensuse::packages::squashfs
  include mopensuse::packages::srm
  include mopensuse::packages::sshd
  include mopensuse::packages::sshfs
  include mopensuse::packages::ssldump
  include mopensuse::packages::sslscan
  include mopensuse::packages::strace
  include mopensuse::packages::stunnel
  include mopensuse::packages::susepaste
  include mopensuse::packages::swaks
  include mopensuse::packages::sysstat
  include mopensuse::packages::systemd
  include mopensuse::packages::taskwarrior
  include mopensuse::packages::tcpdump
  include mopensuse::packages::tcpproxy
  include mopensuse::packages::termshare
  include mopensuse::packages::testdisk
  include mopensuse::packages::texlive_latex_bin_bin
  include mopensuse::packages::tig
  include mopensuse::packages::tmux
  include mopensuse::packages::toxiproxy
  include mopensuse::packages::translateshell
  include mopensuse::packages::tree
  include mopensuse::packages::tsung
  include mopensuse::packages::ttyrec
  include mopensuse::packages::vagrant
  include mopensuse::packages::vcs
  include mopensuse::packages::vdirsyncer
  include mopensuse::packages::vim
  include mopensuse::packages::virtualbox
  include mopensuse::packages::wget
  include mopensuse::packages::whois
  include mopensuse::packages::wireshark
  include mopensuse::packages::wrk
  include mopensuse::packages::x11vnc
  include mopensuse::packages::xdebug_tmpfiles
  include mopensuse::packages::xtrabackup
  include mopensuse::packages::xvfb
  include mopensuse::packages::yadm
  include mopensuse::packages::yarn
  include mopensuse::packages::youtube_dl
  include mopensuse::packages::yum_scripts
  include mopensuse::packages::zabbix
  include mopensuse::packages::zabbix_agent

  include mopensuse::packages::gui::adobe_source_code_pro_fonts
  include mopensuse::packages::gui::byzanz
  include mopensuse::packages::gui::calibre
  include mopensuse::packages::gui::calligra_plan
  include mopensuse::packages::gui::cherrytree
  include mopensuse::packages::gui::chrome
  include mopensuse::packages::gui::chromium
  include mopensuse::packages::gui::dfeet
  include mopensuse::packages::gui::filezilla
  include mopensuse::packages::gui::flash_player
  include mopensuse::packages::gui::four_pane
  include mopensuse::packages::gui::ghex
  include mopensuse::packages::gui::gitg
  include mopensuse::packages::gui::glade
  include mopensuse::packages::gui::glogg
  include mopensuse::packages::gui::glxgears
  include mopensuse::packages::gui::gnome_disk_utility
  include mopensuse::packages::gui::gobby
  include mopensuse::packages::gui::gstreamer_plugins
  include mopensuse::packages::gui::gtranslator
  include mopensuse::packages::gui::gvim
  include mopensuse::packages::gui::hardinfo
  include mopensuse::packages::gui::jetbrains_toolbox
  include mopensuse::packages::gui::kapptemplate
  include mopensuse::packages::gui::kate
  include mopensuse::packages::gui::kcachegrind
  include mopensuse::packages::gui::kdbg
  include mopensuse::packages::gui::kdeconnect
  include mopensuse::packages::gui::kdiff3
  include mopensuse::packages::gui::kio_gdrive
  include mopensuse::packages::gui::krdc
  include mopensuse::packages::gui::krusader
  #include mopensuse::packages::gui::kup
  include mopensuse::packages::gui::labplot
  include mopensuse::packages::gui::libqt4_x11
  include mopensuse::packages::gui::live_usb_gui
  include mopensuse::packages::gui::lshw_gui
  include mopensuse::packages::gui::minitube
  include mopensuse::packages::gui::mozillathunderbird
  include mopensuse::packages::gui::mplayer
  include mopensuse::packages::gui::mysql_workbench
  include mopensuse::packages::gui::nemiver
  include mopensuse::packages::gui::okteta
  include mopensuse::packages::gui::owasp_zap
  include mopensuse::packages::gui::owncloud_client
  include mopensuse::packages::gui::pdfchain
  include mopensuse::packages::gui::pdfcompare
  include mopensuse::packages::gui::peek
  include mopensuse::packages::gui::pgadmin
  include mopensuse::packages::gui::pidgin
  include mopensuse::packages::gui::plantuml
  include mopensuse::packages::gui::plasma_nm_openvpn
  include mopensuse::packages::gui::poedit
  include mopensuse::packages::gui::postman
  include mopensuse::packages::gui::python_kde4
  include mopensuse::packages::gui::python_kdebase4
  include mopensuse::packages::gui::qps
  include mopensuse::packages::gui::recordmydesktop
  include mopensuse::packages::gui::redshift
  include mopensuse::packages::gui::retext
  include mopensuse::packages::gui::rsibreak
  include mopensuse::packages::gui::scrot
  include mopensuse::packages::gui::sddm
  include mopensuse::packages::gui::shutter
  include mopensuse::packages::gui::skrooge
  include mopensuse::packages::gui::skypeforlinux
  include mopensuse::packages::gui::slack
  include mopensuse::packages::gui::soapui
  include mopensuse::packages::gui::sqlitebrowser
  include mopensuse::packages::gui::steam
  include mopensuse::packages::gui::step
  include mopensuse::packages::gui::susepaste_screenshot
  include mopensuse::packages::gui::susepaste_qt
  include mopensuse::packages::gui::telegram
  include mopensuse::packages::gui::vcs
  include mopensuse::packages::gui::virtualbox_qt
  include mopensuse::packages::gui::vivaldi
  include mopensuse::packages::gui::wireshark_qt
  include mopensuse::packages::gui::xbindkeys
  include mopensuse::packages::gui::xclip
  include mopensuse::packages::gui::xorg_x11_server_extra
  include mopensuse::packages::gui::xrectsel
  include mopensuse::packages::gui::xsel
  include mopensuse::packages::gui::xwininfo
  include mopensuse::packages::gui::yakuake
  include mopensuse::packages::gui::zeal
  include mopensuse::packages::gui::zenity

  include mopensuse::user::marcin
  include mopensuse::printers::hp
  include mopensuse::printers::samsung

  include mopensuse::samba::shares::public
  include mopensuse::samba::users::guest
  include mopensuse::samba::users::marcin

  include mopensuse::pki::hosting-ftp
}
