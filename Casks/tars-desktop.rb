cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.51.0"
  sha256 arm:   "c0b40a8794bfea0ba744461bd437406cf7a9bbd4d807f876692b1b06cd7b3473",
         intel: "19534ea4e88e38441dc0c99b51b8dd074444931588b658302ad1373f148e798e"

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
