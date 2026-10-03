cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.0"
  sha256 arm:   "ebc7f7bced0d3e00e1b5b8ea44743fdc0bcc33850683d5fbdfd988b0961cda12",
         intel: "ca0f908bab188eb0ddd2123ae4fca95e9d71f0d860442a973dd73d04bc1d5b5d"

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
