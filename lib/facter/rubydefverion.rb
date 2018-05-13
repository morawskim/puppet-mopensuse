Facter.add(:rubydefverion) do
  confine :kernel => "Linux"
  setcode do
    output = Facter::Core::Execution.exec('/usr/bin/ruby --version')

    unless output.nil?
      full = output.to_s.lines.first.split(' ')[1]
      matches = full.match(/([\d]+)\.([\d]+)\.([\d]+)p([\d]+)/)

      if matches.captures
        (major, minor, tiny, patch) = matches.captures
        {
          "full" => full,
          "major" => major,
          "minor" => minor,
          "tiny" => tiny,
          "patch" => patch,
          "majversion" => major.to_s + '.' + minor.to_s
        }
      end
    end
  end
end

