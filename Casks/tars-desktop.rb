cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.43.2"
  sha256 arm:   "94c1808e9f8f0fc05046c029a98f1d500aab2ee6803e6031276a3e28dbc9ca53",
         intel: "263d045de778f36b89c7d171bf24713a5ab4126e3d11e48e398d7bd83a922a82"

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
