cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.1"
  sha256 arm:   "b91c27561f45535a2320476608b92f0f7e960823003c41f1abad5e36c7b310e4",
         intel: "3206815c240f0ae010f2c63cc1b9d3d494ddc1c89085511f31ff0898d8bad888"

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
