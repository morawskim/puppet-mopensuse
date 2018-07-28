Puppet::Type.type(:mongodb_user).provide(:suse, parent: :mongodb) do
  desc 'Manage users for a MongoDB database.'

  defaultfor operatingsystem: [:OpenSuSE]

  # On openSuSE Leap 15, mongodb config file contain hierarchy.
  # We don't have key net.bindIp, but [net][bindIp].
  # So we use Hash.dig method to extract this values
  def self.mongo_conf
    file = mongod_conf_file
    # The mongo conf is probably a key-value store, even though 2.6 is
    # supposed to use YAML, because the config template is applied
    # based on $mongodb::globals::version which is the user will not
    # necessarily set. This attempts to get the port from both types of
    # config files.
    config = YAML.load_file(file)
    config_hash = {}
    if config.is_a?(Hash) # Using a valid YAML file for mongo 2.6
      config_hash['bindip'] = config['net.bindIp'] || config.dig('net', 'bindIp')
      config_hash['port'] = config['net.port'] || config.dig('net', 'port')
      config_hash['ipv6'] = config['net.ipv6'] || config.dig('net', 'ipv6')
      config_hash['allowInvalidHostnames'] = config['net.ssl.allowInvalidHostnames'] || config.dig('net', 'ssl', 'allowInvalidHostnames')
      config_hash['ssl'] = config['net.ssl.mode'] || config.dig('net', 'ssl', 'mode')
      config_hash['sslcert'] = config['net.ssl.PEMKeyFile'] || config.dig('net', 'ssl', 'PEMKeyFile')
      config_hash['sslca'] = config['net.ssl.CAFile'] || config.dig('net', 'ssl', 'CAFile')
      config_hash['auth'] = config['security.authorization'] || config.dig('security', 'authorization')
      config_hash['shardsvr'] = config['sharding.clusterRole'] || config.dig('sharding', 'clusterRole')
      config_hash['confsvr'] = config['sharding.clusterRole'] || config.dig('sharding', 'clusterRole')
    else # It has to be a key-value config file
      config = {}
      File.readlines(file).map do |line|
        k, v = line.split('=')
        config[k.rstrip] = v.lstrip.chomp if k && v
      end
      config_hash['bindip'] = config['bind_ip']
      config_hash['port'] = config['port']
      config_hash['ipv6'] = config['ipv6']
      config_hash['ssl'] = config['sslOnNormalPorts']
      config_hash['allowInvalidHostnames'] = config['allowInvalidHostnames']
      config_hash['sslcert'] = config['sslPEMKeyFile']
      config_hash['sslca'] = config['sslCAFile']
      config_hash['auth'] = config['auth']
      config_hash['shardsvr'] = config['shardsvr']
      config_hash['confsvr'] = config['confsvr']
    end

    config_hash
  end
end

