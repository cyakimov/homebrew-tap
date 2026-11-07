cask "metron-app" do
  version "0.1.5"
  sha256 "7c997c629ffb9f590a977534ee933f417d355486dbfe8dddd4f94e76ca43e403"

  url "https://github.com/cyakimov/metron/releases/download/v#{version}/Metron-#{version}-universal.dmg"
  name "Metron"
  desc "Claude and Codex account limits in your menu bar"
  homepage "https://github.com/cyakimov/metron"

  depends_on macos: :sonoma

  app "Metron.app"

  uninstall quit: "com.cyakimov.metron"

  zap trash: [
    "~/Library/Application Support/Metron",
    "~/Library/Group Containers/group.com.cyakimov.metron",
    "~/Library/Preferences/com.cyakimov.metron.plist",
  ]
end
