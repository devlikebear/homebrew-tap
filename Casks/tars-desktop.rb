cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.42.1"
  sha256 arm:   "a55fdb0b7e058d76b9dc756b45442112ca1868955642d0c1fdc7d49a869bcfe5",
         intel: "e355d5b0b3a4961cf4ec3b933e16791761b5d645d02e8f60c9341a2bf178c5dd"

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
