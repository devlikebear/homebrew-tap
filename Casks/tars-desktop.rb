cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.4"
  sha256 arm:   "6e2d4b275334daa5006135d2ffcddf4557e782151ba8a24b4f0f1fbade89b2b6",
         intel: "6f378d5c139aac39d7dba4752c301112caf9307db00166eb020c8a5ab4fc2279"

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
