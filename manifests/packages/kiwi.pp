  class mopensuse::packages::kiwi($ensure = 'present') {
      
      package {['kiwi', 'kiwi-templates', 'kiwi-tools', 'kiwi-config-openSUSE']:
          ensure  => $ensure,
      }
      
  }