cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.58.1"
  sha256 arm:   "d530b77048c80b793c74637432fff31afef8fdeb43f37a3d31ae87351042f345",
         intel: "d0c2eeefa4f0cd958ed1c5164a9a6cc86dbcd4d5a8c7e21c9e8c49dd5e0e6bab"

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
