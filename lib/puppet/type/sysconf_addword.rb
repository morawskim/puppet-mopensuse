Puppet::Type.newtype(:sysconf_addword) do
  @doc = 'Add word WORD to variable VAR in file FILE if present, or remove if absent.
If multiple lines matching ^VAR= are found (which happens to be a habit of
mine), only the last one is manipulated.

It does not work for WORD starting with characters like a dash which
prevent word boundary matching.
'

  def self.title_patterns
    [
      [/(^([^\#]*)$)/m,
       [[:file]]],
      [/^([^\#]+)\#([^:]+):([\w\-]+)$/,
       [[:file], [:var], [:val]]],
    ]
  end

  ensurable

  newparam(:file) do
    desc 'Description of file param'

    isnamevar

    validate do |_value|
      true
    end
  end

  newparam(:var) do
    desc 'Description of var param'
    isnamevar
    end

  newparam(:val) do
    desc 'Description of val param'
    isnamevar
  end

  newproperty(:value, array_matching: :first) do
    def insync?(is)
      (' ' + is + ' ').include? " #{should} "
    end

    munge(&:strip)
  end
end
