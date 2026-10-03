cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.44.3"
  sha256 arm:   "27f1017b7cfdce4c65519b9491e26df65ddf9f34c6df87d4b002912246308e48",
         intel: "8fa3532c1babb2a1f385dee98070216ecd979dda26ef2f86a480c5617198294a"

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
