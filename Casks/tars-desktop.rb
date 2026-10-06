cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.50.0"
  sha256 arm:   "a87f0c0d29826df0eb37c2eaa75e7da01bad58749e194eaaf943632dafeabcb8",
         intel: "5ef8a753a10bf4ef134df0f5209da117832876e717b7e1e00322e979c04aaa60"

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
