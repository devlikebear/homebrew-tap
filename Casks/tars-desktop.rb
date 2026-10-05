cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.1"
  sha256 arm:   "4e0eb421e3ba286f59a818b2b9c7ede4530204a8fdffb26476d1077202e3dab4",
         intel: "d453a6c2ff99f18b7727db927d2c0ac49a18ae1c7ada5f3fad7b42d407a66c41"

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
