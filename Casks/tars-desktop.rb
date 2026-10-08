cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.56.0"
  sha256 arm:   "edc5142d2e4af8a204346119562ab63305dcff9e59ce2a07fa420f14cc02a650",
         intel: "a24fb3f6c828e62b2000c92f5fa945f550744436366dbd84a82f8da0a310d0c2"

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
