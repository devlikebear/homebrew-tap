cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.52.0"
  sha256 arm:   "6a7d45a83fe6533aed47b297d555f09bdf20d9c35d076ba22b41d9ca0baf1068",
         intel: "bfc7e050dbbf4b284846acbc1f9ea630ac19bc7768a6888f5ab2cfcf622f361b"

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
