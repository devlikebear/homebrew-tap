cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.3"
  sha256 arm:   "170cc3baf1741d05a88287702f99bc3b76e6155b0b3d8fe76b146be9150c3597",
         intel: "28fe52ebc6a2104fbae4faa66f65c24d9f8b4039b9604204cb2707e6cc82861f"

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
