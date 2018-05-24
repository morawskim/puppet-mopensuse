Facter.add(:fonts) do
  confine kernel: 'Linux'
  setcode do
    output = Facter::Core::Execution.exec('fc-list | cut -d: -f2 | cut -d, -f1 | sed -e "s/^[ \t]*//" | sort | uniq')
    output = output.split("\n") unless output.nil?
    output
  end
end
