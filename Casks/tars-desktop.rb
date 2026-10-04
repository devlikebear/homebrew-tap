cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.9"
  sha256 arm:   "6ce2a621464634c3d97a23b2e98a06c3315527c6ac04686dd3f13c9c1e1fae39",
         intel: "342914318720568aedd1aabd671d31dd3a0a14f4e989144aa0d5e26b148cc579"

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
