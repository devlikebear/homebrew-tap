cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.57.1"
  sha256 arm:   "3a251b8d1c355ccc2eb173d0f3621f4212b1a083c51ec2dc603692df524b3ff7",
         intel: "5d9eb154540499f611cf758de41d9a204d0f50e456444183e1e28071d4bfc93e"

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
