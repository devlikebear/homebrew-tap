cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.6"
  sha256 arm:   "0784bf73419012fa41909458629e7fd6786604f3187fab4c0466d8d96660c397",
         intel: "1be83ef48b0238a3fd75f27ecd67e2e47724a98529a1323ecdabc33311e43a18"

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
