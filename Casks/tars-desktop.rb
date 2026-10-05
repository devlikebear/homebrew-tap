cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.46.2"
  sha256 arm:   "9272e26fe8ae496baa26e0c9ff7e1833be6f928247e99d880b866e63402d32ed",
         intel: "64bbb3d64e3dea39733b2db1956b4f86ad7fba560d3a2a9b490eb87ee908d8d5"

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
