cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.59.0"
  sha256 arm:   "b4321d1c2441c1d1957d67df3cf82e8c9b061747dd0b35573d172e6f6d0e1647",
         intel: "81bb77cd5c1d6e3eda0888a4bf545052719cec164cc3fed87fcab57ec0e81f47"

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
