cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.55.0"
  sha256 arm:   "1d44562625f67690e26fc9d87270bc3f6355ad549c24b4c0825422198cf516b0",
         intel: "411903a61f8c405efe82eee96e73f5a659210f44666a835eabd9581b3b9a26bb"

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
