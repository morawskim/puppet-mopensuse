Facter.add(:vagrant_version) do
  confine :kernel => "Linux"
  setcode do
      output = Facter::Core::Execution.exec('vagrant --version')
      if output == nil
        nil
      else
        output.split(' ')[1]
      end
  end
end
