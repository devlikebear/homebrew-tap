cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.7"
  sha256 arm:   "63cb4f9af5580208e53bf099c1b35a836dbed6e7ca780ed7afb1b529bb7f2595",
         intel: "93f1b97720af96bb971e28310f85d8d6fe0c27763895e37c12fc6eaa5fc7d876"

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
