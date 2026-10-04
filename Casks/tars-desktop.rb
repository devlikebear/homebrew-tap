cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.46.0"
  sha256 arm:   "65839d54d72dce8fd728cc0b471b10709b109c9c03770cf956a6af1cb0b8a2e0",
         intel: "92c3e4e99171f82a4ee22321b52396ddf4c06005b6fc427ddf594dfbdd73c0c4"

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
