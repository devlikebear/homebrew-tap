cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.8"
  sha256 arm:   "c6f631f886fe2c15a98d18339831be3fce024c83ae1b0e7cdc8130e562eb4219",
         intel: "610343b52d3468620a3c4162189cfb71262c588943ef5814e62735a1dabbd616"

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
