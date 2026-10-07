cask "kvotar" do
  version "0.3.0-beta.10,19"
  sha256 "d6d882ad672092b48ec8afda62500a92258d8d9ca7428f9852a1f4e8557565c9"

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
