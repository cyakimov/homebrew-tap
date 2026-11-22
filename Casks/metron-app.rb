cask "metron-app" do
  version "0.1.6"
  sha256 "429189b0de374f7cd1d8cacea502f87272b071598e4271fdb89ed80c0b8bcc37"

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
