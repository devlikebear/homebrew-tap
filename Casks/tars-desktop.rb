cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.5"
  sha256 arm:   "2b26e5d647ed2f22d9c06120f3c47251e4539f9ddba2aac2878fa1bea38b7cd8",
         intel: "ceb39a5f237a3e2f1993e997134c1c53fd7ad83d5aea71eb023adc0f946febb6"

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
