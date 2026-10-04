cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.5"
  sha256 arm:   "f02c499082e64f51228a4ada5d34be8ead16994ebce1f12c45c8a92cc451b3fd",
         intel: "cc225b8523a3837910b545d99f57da45b566767003aaaff71cfdc456f09f9672"

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
