cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.3"
  sha256 arm:   "10765630bb6122db9ed6ab41165a5f184201e8cd06b25383b119b9fdfb7271ca",
         intel: "2d5a4339c76e77eec7149b57a97efeeb45535bcea8d4f197b4e462a5a69082a8"

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
