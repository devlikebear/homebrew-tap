cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.48.0"
  sha256 arm:   "ec6f57c95ce3432630cd96e98fc02dde1d0578cd012532d3281b605c399092f4",
         intel: "7a2e9b391cf1a9ab191cb7f1c125960a95653c490c83cb09aec53709668e5d5d"

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
