module Puppet::Parser::Functions
    newfunction(:vncpassword, :type => :rvalue) do |args|
        require_relative '../../../ruby-vnc/des.rb'
        
        if args.size < 1 then
            raise(Puppet::ParseError, "vncpassword(): No arguments given")
        end
        if args.size > 1 then
            raise(Puppet::ParseError, "vncpassword(): Too many arguments given (#{args.size})")
        end
        
        unless args[0].is_a?(String)
            raise(Puppet::ParseError, 'vncpassword(): Requires string as argument')
        end
        
        password = args[0].slice(0,8)
        encrypt_password = Cipher::DES.encrypt [23,82,107,6,35,78,88,7].pack("C8"), password 
        return encrypt_password
    end
end