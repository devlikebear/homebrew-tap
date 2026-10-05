cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.46.1"
  sha256 arm:   "181d13c090906199cff30b415a8a10e8e1bd06dcfb8f5a0ae64c2b11be1fd582",
         intel: "20e9f58f09586266951410d51d4020bc030debef47e57e7296eb2713c127700c"

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
