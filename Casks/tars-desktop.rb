cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.61.0"
  sha256 arm:   "da48f5f67f0dbd5c309e6ef4cca3e7ca30121d782841ebaff509704562683f6c",
         intel: "06a3bc12107b655170f856cd7c6cbac2ae3fb520cea731fec817c1b713438c63"

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
