cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.43.3"
  sha256 arm:   "f7be04a1065e0e25abe0bedc56599a1a26ded4eea3f3dbea21b3f7d427b8d52d",
         intel: "6c398f20eaf30e66eb6f16d1c6564de9754fd5981307b969f91b5ee87fc60912"

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
