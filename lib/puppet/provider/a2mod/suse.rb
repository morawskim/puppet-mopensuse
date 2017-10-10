require 'puppet/provider/a2mod'

Puppet::Type.type(:a2mod).provide(:suse, :parent => Puppet::Provider::A2mod) do
    desc "Manage Apache 2 modules on openSuSE"

    commands :encmd => "a2enmod"

    confine :osfamily => :suse
    defaultfor :operatingsystem => [:OpenSuSE]

    def self.instances
      modules = encmd("-l").split(' ')

      modules.map do |mod|
        new(
          :name     => mod,
          :ensure   => :present,
          :provider => :suse
        )
      end
    end

    def create
        encmd resource[:name]
    end

    def destroy
        encmd '-d', resource[:name]
    end
end
