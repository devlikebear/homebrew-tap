cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.44.1"
  sha256 arm:   "1e1200c3fd083aea713a1d6e74139cba81c1e56edc469bb2109e7d50db3f78ca",
         intel: "19a547fa438a9eaac4a8a86223970eecba48232e09da00d032267e2758d1e190"

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
