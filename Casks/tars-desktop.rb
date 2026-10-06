cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.49.1"
  sha256 arm:   "107b2647cc9dd61db3ca2f2a8a95b97a5359018026852fb562c92d12d622223b",
         intel: "8ce33fdacd88a1e3363dfc2f421a11f9ec087db9276acea79a0e20424fccb7ad"

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
