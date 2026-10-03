cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.43.4"
  sha256 arm:   "37a4609ea4c8f206cce8dc7b1110752452c02db69109f610c694fd2b0c3ac25f",
         intel: "338b90a53ae9240ec6f9e1999086901982dc3b5aa908d3919040da539838cc7c"

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
