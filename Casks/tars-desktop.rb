cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.43.0"
  sha256 arm:   "1b9edd7d3770474b8abad097662e257895672d3e9539975845452df59ef6874a",
         intel: "8ecbaa64910270324059858545074ca1cf673ec561b9545c5d7de60e931161f2"

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
