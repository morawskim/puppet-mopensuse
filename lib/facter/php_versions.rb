Facter.add(:php_versions) do
  confine :kernel => "Linux"
  setcode do
    ENV['PHP_VERSIONS']
  end
end

