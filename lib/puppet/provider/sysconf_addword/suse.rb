Puppet::Type.type(:sysconf_addword).provide(:suse) do
  desc 'Description of this provider'

  commands sysconf_addword: 'sysconf_addword'

  def create
    sysconf_addword resource[:file], resource[:var], resource[:value]
  end

  def destroy
    sysconf_addword '-r', resource[:file], resource[:var], resource[:value]
  end

  def value
    sysconfig_var_value
  end

  def value=(val)
    # set_value(val)
  end

  def exists?
    (' ' + sysconfig_var_value + ' ').include? " #{resource[:value]} "
  end

  def sysconfig_var_value
    lines = File.readlines(resource[:file])
    line = lines.grep(/^\s*#{resource[:var]}/).last
    return '' unless line
    chunks = line.split('=', 2)
    return '' if chunks.size != 2
    chunks[1].strip[1..-2]
  end
end
