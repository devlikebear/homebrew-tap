cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.57.0"
  sha256 arm:   "96329ac4dab2d2772b406edc5e470355cd68d11d5d7e71b1184bf232005ae17f",
         intel: "36fa54b1f6a30c729b5f2202962ceeb25bd1b459e70e9186e2ab6bbb5b7d10b9"

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
