cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.49.0"
  sha256 arm:   "649400946436d740334056d674e4708e460ffdec5a6feabb1ea583ac1b547c6c",
         intel: "eb9ea743a975bee5e0eab531040dcbce70c91655ba71d2313039832d4c762980"

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
