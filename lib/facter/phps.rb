Facter.add(:phps) do
  confine :kernel => "Linux"
  setcode do
    phps = {}
    php_versions = Facter.value(:php_versions)
    if php_versions.nil?
        return nil
    end
    php_versions.split(' ').each do |dir|
        dirs = Dir.glob("#{dir}/*").select {|f| File.directory? f}
        dirs.each do |dir|
            php_bin = "#{dir}/usr/bin/php-config"
            if File.file? php_bin
                output = `#{php_bin} --version`
                if output && !output.empty?
                    version = output.chomp

                    phps[version] = {:path => File.dirname(php_bin), :version => version}
                    major, minor, patch = version.split('.')

                    if phps[major] && Gem::Version.new(phps[major][:version]) < Gem::Version.new(version)
                        phps[major] = phps[version]
                    end

                    if phps[major].nil?
                        phps[major] = phps[version]
                    end

                    key = major + '.' + minor
                    if phps[key] && Gem::Version.new(phps[key][:version]) < Gem::Version.new(version)
                        phps[key] = phps[version]
                    end

                    if phps[key].nil?
                        phps[key] = phps[version]
                    end
                end
            end
        end
    end

    data = {}
    phps.each do |key, value|
        data[key] = value[:path]
    end
    data
  end
end

