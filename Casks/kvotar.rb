cask "kvotar" do
  version "0.3.0-beta.11,20"
  sha256 "29b7de01a7cedb3ece326d106e2a48413914a06123c0c842555f547744d5ddcb"

  url "https://updates.kvotar.com/builds/Kvotar-#{version.csv.first}-build.#{version.csv.second}-macos-universal.zip"
  name "Kvotar"
  desc "Menu bar monitor for Claude Code and Codex quota"
  homepage "https://kvotar.com/"

  # The feed's shortVersionString has no beta label; the label is only in the file name.
  livecheck do
    url "https://updates.kvotar.com/appcast.xml"
    strategy :sparkle do |item|
      match = item.url&.match(/Kvotar-(.+)-build\.(\d+)-macos-universal\.zip/i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Kvotar.app"

  uninstall quit: "com.vladimirmarkovic.kvotar"

  zap trash: [
    "~/Library/Application Support/Kvotar",
    "~/Library/Caches/com.vladimirmarkovic.kvotar",
    "~/Library/HTTPStorages/com.vladimirmarkovic.kvotar",
    "~/Library/Logs/Kvotar",
    "~/Library/Preferences/com.vladimirmarkovic.kvotar.plist",
    "~/Library/WebKit/com.vladimirmarkovic.kvotar",
  ]
end
