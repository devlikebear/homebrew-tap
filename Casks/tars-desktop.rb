cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.43.1"
  sha256 arm:   "4c0aca363f28104ed16931858da7d53d3744e62a155b80ef8bfbd37b75518ae3",
         intel: "9f9f3e505534b715d709a87a7d1fad79d598db6b58377160ac70e7c9d4d1caef"

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
