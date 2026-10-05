cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.2"
  sha256 arm:   "32e2509b4d104917e0cea553451bcf9236a37380b961bef9caf2225640a11618",
         intel: "efb75656dfbc111975cb7fcc27271d87688bbe353b6746cb8338f5ddf567352a"

  url "https://github.com/devlikebear/tars/releases/download/v#{version}/tars-desktop_#{version}_darwin_#{arch}.tar.gz"
  name "TARS"
  desc "Desktop app for the local TARS server"
  homepage "https://github.com/devlikebear/tars"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app replaces itself from GitHub releases (tray: Check for updates).
  auto_updates true
  depends_on formula: "devlikebear/tap/tars"
  depends_on :macos

  app "TARS.app"

  zap trash: [
    "~/Library/Application Support/tars-desktop",
    "~/Library/Caches/com.devlikebear.tars.desktop",
    "~/Library/WebKit/com.devlikebear.tars.desktop",
  ]
end
