class mopensuse::packages::devel_qt5($ensure = 'present') {
  
    package {['libQt5Gui-private-headers-devel', 'libqt5-qtbase-devel',
        'libqt5-qtdeclarative-devel', 'libqt5-qtsvg-devel',
        'libqt5-qttools-devel', 'libqt5-qtx11extras-devel',
        'libqt5-qtxmlpatterns-devel', 'patterns-openSUSE-devel_qt5',
        'libqt5-qtimageformats-devel',
        'libqt5-qtlocation-devel', 'libqt5-qtmultimedia-devel',
        'libqt5-qtscript-devel', 'libqt5-qtsensors-devel',
        'libqt5-qtserialport-devel', 'libqt5-qtwebsockets-devel',
        'libQt5WebKit5-devel'
    ]:
    ensure => $ensure,
  }

}
