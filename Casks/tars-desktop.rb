cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.0"
  sha256 arm:   "3b2b5f0448ace0db6789350d4b2b466d6edae3761a97189b347be47eb38702ba",
         intel: "c6095bfd86ed2444ade57a0e94a5a9f02d59ee9816e552e4b4eb4e80dc1b68f3"

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
