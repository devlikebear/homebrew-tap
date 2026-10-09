cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.58.0"
  sha256 arm:   "3993243ae8de4fb3137510c82588b11dc5938ce17e9af9c5855d25d48b408ff4",
         intel: "fb2b2ba8db49f1e8c389318fba42d0da1d0c0f42e6d34986e208f8bb01022fce"

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
