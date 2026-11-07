cask "metron-app" do
  version "0.1.4"
  sha256 "80ad0983fdf4cf90a4c58c7b2171dfb78b4664bc9481e0be23e303b7cd3eddcf"

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
