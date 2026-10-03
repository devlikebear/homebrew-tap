cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.44.2"
  sha256 arm:   "e8c42bbbad3e43158b0fb011047324e65d55a772942c95646712564a66772125",
         intel: "24aeb8e2c459fcae9e93a86be5ab0485e24b6483d7fbce5a21ad08f746e2802e"

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
