cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.53.0"
  sha256 arm:   "0e017b43f895bbdff7fa767ca20d3a3aa0365ec9ff85a0263eba3a599aa5e658",
         intel: "159f30fc6ba66d9f39e8f910ce35c1dc5079fc145f1732086a59a251d54cc381"

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
