Facter.add(:user_home) do
  setcode do
    File.expand_path('~/')
  end
end
