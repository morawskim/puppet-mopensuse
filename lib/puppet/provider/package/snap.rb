Puppet::Type.type(:package).provide(:snap, :parent => ::Puppet::Provider::Package) do
    desc "snap package provider"

    commands :snap => "snap"
    has_feature :installable, :uninstallable
    
    def self.instances
        packages = []
        output = snap 'list'
        
        output.lines.drop(1).each do |line|
            if line.chomp =~ /^([\w\-]+) .+$/
                options = {:ensure => 'present', :name => $1, :provider => name}
                packages << new(options)
            end
        end

        packages
    end
    
    # Return structured information about a particular package or `nil` if
    # it is not installed or `snap` itself is not available.
    def query
        self.class.instances.each do |provider_snap|
            return provider_snap.properties if @resource[:name] == provider_snap.name
        end
        return nil
    end

    def install
        snap 'install', resource[:name]
    end

    def uninstall
        snap 'remove', resource[:name]
    end

    def exists?
        snap 'list', resource[:name]
    end
end
