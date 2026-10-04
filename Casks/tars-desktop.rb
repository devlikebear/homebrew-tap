cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.7"
  sha256 arm:   "02d855c4d1131d52a0a76db3dddbde0a0e888cdb9baa312533c265bc9f6e9848",
         intel: "f77ff6b5e88cebe6c05a25b711b83e92c0eca264b8d9c8efa0a45b2507357123"

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
