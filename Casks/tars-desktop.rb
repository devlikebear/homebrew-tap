cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.2"
  sha256 arm:   "6cad5ccd4b2dc942c8ec44a68a69c693b529fb6f7e0589d441dc08e509a40dd0",
         intel: "da42a16cd63c9e00922f09b9992fb3266f66d68a29d72bc78b79d8c04bbf0fad"

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
