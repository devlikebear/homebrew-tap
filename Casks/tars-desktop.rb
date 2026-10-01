cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.42.2"
  sha256 arm:   "f9e8a86b5b0425f0b0df1116fd31b83a884d10e1beea720037359ed5f7a10594",
         intel: "b0bf57218d26d68ec784975fd01af4326c159bdbbf2548312fdacb8289ef60bc"

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
