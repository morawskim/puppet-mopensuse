  class mopensuse::packages::kiwi {
      
      package {['kiwi', 'kiwi-templates', 'kiwi-tools', 'kiwi-config-openSUSE']:
          ensure  => present,
      }
      
  }