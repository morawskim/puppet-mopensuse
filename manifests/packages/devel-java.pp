class mopensuse::packages::devel-java {
  
  package {['java-1_8_0-openjdk-devel', 'java-1_7_0-openjdk-devel']:
    ensure => present
  }
  
}